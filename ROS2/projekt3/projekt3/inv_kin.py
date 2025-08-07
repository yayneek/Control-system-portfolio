import rclpy
from rclpy.node import Node
from geometry_msgs.msg import PointStamped
from sensor_msgs.msg import JointState
import numpy as np
from scipy.optimize import fsolve

class InverseKinematics(Node):
    def __init__(self):
        super().__init__('inverse_kinematics')
        self.subscription = self.create_subscription(PointStamped,'/clicked_point',self.point_callback,10)
        self.publisher = self.create_publisher(JointState,'/joint_states',10)

    def point_callback(self, msg):
        joint_states = JointState()
        joint_states.header.stamp = self.get_clock().now().to_msg()
        joint_states.name = ['Joint_1','Joint_2','Joint_3','Gripper_joint_1', 'Gripper_joint_2']

        def IK(vars):
            x = msg.point.x
            y = msg.point.y
            z = msg.point.z
            l1 = 0.9
            l2 = 0.6
            l3 = 0.6
            position = np.transpose(np.array([x, y, z]))
            r1 = np.array([0,0,l1])
            r2 = np.array([0,l2,0])
            r3 = np.array([0,l3,0])

            R1 = np.array([
                [np.cos(vars[0]), -np.sin(vars[0]), 0],
                [np.sin(vars[0]), np.cos(vars[0]), 0],
                [0, 0, 1]
            ])
            R2 = np.array([
                [1, 0 , 0],
                [0, np.cos(vars[1]), -np.sin(vars[1])],
                [0, np.sin(vars[1]), np.cos(vars[1])]
            ])
            R3 = np.array([
                [1, 0 , 0],
                [0, np.cos(vars[2]), -np.sin(vars[2])],
                [0, np.sin(vars[2]), np.cos(vars[2])]
            ])
            effector_position = np.dot(R1, r1 + np.dot(R2, r2 + np.dot(R3, r3)))
            sol = position - effector_position
            return sol

        initial_guess = np.array([0,0,0])
        solution = fsolve(IK, initial_guess)
        adjusted_solution = solution
        joint_positions = [float(adjusted_solution[0]), float(adjusted_solution[1]), float(adjusted_solution[2]), 0.0, 0.0]
        
        joint_states.position = joint_positions
        self.publisher.publish(joint_states)

def main(args=None):
    rclpy.init(args=args)
    ik_node = InverseKinematics()
    rclpy.spin(ik_node)
    ik_node.destroy_node()
    rclpy.shutdown()

if __name__ == '__main__':
    main()