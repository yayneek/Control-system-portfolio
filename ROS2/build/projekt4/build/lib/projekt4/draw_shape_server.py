import rclpy
import time
from rclpy.action import ActionServer
from rclpy.node import Node
from tutorial_interfaces.action import DrawShape
from visualization_msgs.msg import Marker
from sensor_msgs.msg import JointState
from geometry_msgs.msg import Point
import numpy as np
from scipy.optimize import fsolve

class DrawShapeActionServer(Node):

    def __init__(self):
        super().__init__('draw_shape_action_server')
        self._action_server = ActionServer(
            self,
            DrawShape,
            'draw_shape',
            self.execute_callback)
        self.marker_pub = self.create_publisher(Marker, 'visualization_marker', 10)
        self.joint_publisher_ = self.create_publisher(JointState, 'joint_states', 10)
        self._feedback = DrawShape.Feedback()

        self.marker = Marker()
        self.marker.header.frame_id = "Base"  
        self.marker.type = Marker.SPHERE_LIST
        self.marker.action = Marker.ADD
        self.marker.scale.x = 0.05
        self.marker.scale.y = 0.05
        self.marker.scale.z = 0.05
        self.marker.color.r = 1.0
        self.marker.color.g = 0.0
        self.marker.color.b = 0.0
        self.marker.color.a = 1.0
        self.marker.points = []

    def execute_callback(self, goal_handle):
        self.get_logger().info('Executing goal...')
        joint_states = JointState()
        joint_states.name = ['Joint_1', 'Joint_2', 'Joint_3', 'Gripper_joint_1', 'Gripper_joint_2']

        if goal_handle.request.time_of_motion <= 0:
            goal_handle.abort()
            self.get_logger().info('Podano ujemny czas!')
            return DrawShape.Result(success=False, message="Podano ujemny czas!")

        if goal_handle.request.shape_to_draw != "square":
            goal_handle.abort()
            self.get_logger().info('Aborted: Shape not supported')
            return DrawShape.Result(success=False, message="Shape not supported")

        if goal_handle.request.figure_param <= 0:
            goal_handle.abort()
            self.get_logger().info('Podano ujemna dlugosc boku!')
            return DrawShape.Result(success=False, message="Podano ujemna dlugosc boku")

        
        time_of_motion = goal_handle.request.time_of_motion
        figure_param = goal_handle.request.figure_param
        rate = 10  # 10 Hz
        step_time = 1.0 / rate
        num_steps = int(time_of_motion * rate)

        for i in range(num_steps):
            if goal_handle.is_cancel_requested:
                goal_handle.canceled()
                self.get_logger().info('Goal canceled')
                return DrawShape.Result(success=False, message="Goal canceled")

            # W którym przedziale czasu jestem?
            if i < num_steps / 4:
                position = np.array([figure_param / 2, figure_param / 2 - figure_param * (4 * i / num_steps), 0.8])
            elif i < num_steps / 2:
                position = np.array([figure_param / 2 - figure_param * (4 * (i - num_steps / 4) / num_steps), -figure_param / 2, 0.8])
            elif i < 3 * num_steps / 4:
                position = np.array([-figure_param / 2, -figure_param / 2 + figure_param * (4 * (i - num_steps / 2) / num_steps), 0.8])
            else:
                position = np.array([-figure_param / 2 + figure_param * (4 * (i - 3 * num_steps / 4) / num_steps), figure_param / 2, 0.8])

            

            def IK(vars):
                l1 = 0.9
                l2 = 0.6
                l3 = 0.6
                r1 = np.array([0, 0, l1])
                r2 = np.array([0, l2, 0])
                r3 = np.array([0, l3, 0])

                R1 = np.array([
                    [np.cos(vars[0]), -np.sin(vars[0]), 0],
                    [np.sin(vars[0]), np.cos(vars[0]), 0],
                    [0, 0, 1]
                ])
                R2 = np.array([
                    [1, 0, 0],
                    [0, np.cos(vars[1]), -np.sin(vars[1])],
                    [0, np.sin(vars[1]), np.cos(vars[1])]
                ])
                R3 = np.array([
                    [1, 0, 0],
                    [0, np.cos(vars[2]), -np.sin(vars[2])],
                    [0, np.sin(vars[2]), np.cos(vars[2])]
                ])
                effector_position = np.dot(R1, r1 + np.dot(R2, r2 + np.dot(R3, r3)))
                sol = position - effector_position
                return sol

            initial_guess = np.array([0, np.pi/3, -np.pi/2])
            solution = fsolve(IK, initial_guess)
            adjusted_solution = solution
            joint_positions = [float(adjusted_solution[0]), float(adjusted_solution[1]), float(adjusted_solution[2]), 0.0, 0.0]

            joint_states.header.stamp = self.get_clock().now().to_msg()  
            joint_states.position = joint_positions
            self.joint_publisher_.publish(joint_states)

            
            point = Point()
            point.x = float(position[0])
            point.y = float(position[1])
            point.z = float(position[2])
            self.marker.points.append(point)
            self.marker_pub.publish(self.marker)

            # Update feedback
            self._feedback.percent_complete = (i + 1) / num_steps * 100
            goal_handle.publish_feedback(self._feedback)

            time.sleep(step_time)  

        goal_handle.succeed()
        return DrawShape.Result(success=True, message="Shape drawn successfully")

def main(args=None):
    rclpy.init(args=args)
    draw_shape_action_server = DrawShapeActionServer()
    rclpy.spin(draw_shape_action_server)
    rclpy.shutdown()

if __name__ == '__main__':
    main()