import rclpy
from rclpy.node import Node
from tutorial_interfaces.srv import GripperControl  
from sensor_msgs.msg import JointState

class GripperServer(Node):
    def __init__(self):
        super().__init__('gripper_server')
        self.srv = self.create_service(GripperControl, 'gripper_control', self.gripper_control_callback)
        self.joint_state_publisher = self.create_publisher(JointState, 'joint_states', 10)

    def gripper_control_callback(self, request, response):
        joint_state_msg = JointState()
        joint_state_msg.header.stamp = self.get_clock().now().to_msg()
        joint_state_msg.name = ['Joint_1','Joint_2','Joint_3','Gripper_joint_1', 'Gripper_joint_2']
        
        if request.state.lower() == "open":
            joint_state_msg.position = [0.0, 0.0, 0.0, 0.1, -0.1]  
            response.success = True
            response.message = "Gripper opened"
        elif request.state.lower() == "close":
            joint_state_msg.position = [0.0, 0.0, 0.0, 0.0, 0.0]  
            response.success = True
            response.message = "Gripper closed"
        else:
            response.success = False
            response.message = "Unknown command"
            return response

        self.joint_state_publisher.publish(joint_state_msg)
        return response

def main(args=None):
    rclpy.init(args=args)
    gripper_server = GripperServer()
    rclpy.spin(gripper_server)
    gripper_server.destroy_node()
    rclpy.shutdown()

if __name__ == '__main__':
    main()