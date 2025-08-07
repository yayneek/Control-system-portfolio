import rclpy
from rclpy.node import Node
from turtlesim.srv import Spawn
from turtlesim.srv import Kill

class MyNode(Node):
    def __init__(self):
        super().__init__('my_turtle_node')

        self.kill_turtle('turtle1')

        self.spawn_turtle(3.0, 3.0, 0, 'turtle1')


    def kill_turtle(self, turtle_name):
        client = self.create_client(Kill, 'kill')
        while not client.wait_for_service(timeout_sec=5.0):
            self.get_logger().info('service not available, waiting again...')

        request = Kill.Request()
        request.name = turtle_name

        future = client.call_async(request)

        rclpy.spin_until_future_complete(self, future)

        if future.result() is not None:
            self.get_logger().info(turtle_name + ' killed')
        else:
            self.get_logger().error('Failed to kill ' + turtle_name)

    def spawn_turtle(self, x, y, theta, turtle_name):
        client = self.create_client(Spawn, 'spawn')
        while not client.wait_for_service(timeout_sec=5.0):
            self.get_logger().info('service not available, waiting again...')

        request = Spawn.Request()
        request.x = x
        request.y = y
        request.theta = float(theta)
        request.name = turtle_name

        future = client.call_async(request)
        rclpy.spin_until_future_complete(self, future)
        if future.result() is not None:
            self.get_logger().info(turtle_name + ' spawned successfully')
        else:
            self.get_logger().error('Failed to spawn ' + turtle_name)


def main(args=None):
    rclpy.init(args=args)
    node = MyNode()
    rclpy.spin(node)
    rclpy.shutdown()

if __name__ == '__main__':
    main()