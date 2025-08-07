import sys
import rclpy
from rclpy.node import Node
from tutorial_interfaces.srv import GripperControl

class GripperClient(Node):
    def __init__(self):
        super().__init__('gripper_client')
        self.client = self.create_client(GripperControl, 'gripper_control')
        while not self.client.wait_for_service(timeout_sec=1.0):
            self.get_logger().info('service not available, waiting again...')
        self.req = GripperControl.Request()

    def send_request(self, state):
        self.req.state = state
        self.future = self.client.call_async(self.req)

def main(args=None):
    rclpy.init(args=args)
    gripper_client = GripperClient()
    if len(sys.argv) < 2:
        gripper_client.get_logger().info('Usage: ros2 run projekt3 gripper_client <state>')
        return
    state = sys.argv[1]
    gripper_client.send_request(state)

    while rclpy.ok():
        rclpy.spin_once(gripper_client)
        if gripper_client.future.done():
            try:
                response = gripper_client.future.result()
            except Exception as e:
                gripper_client.get_logger().info('Service call failed %r' % (e,))
            else:
                gripper_client.get_logger().info('Result of gripper_control: %s' % (response.message,))
            break

    gripper_client.destroy_node()
    rclpy.shutdown()

if __name__ == '__main__':
    main()