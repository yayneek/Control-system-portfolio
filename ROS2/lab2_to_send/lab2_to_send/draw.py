import rclpy
from rclpy.node import Node
from turtlesim.srv import Spawn
from turtlesim.srv import Kill
from geometry_msgs.msg import Twist
from turtlesim.msg import Pose


class MyNode(Node):
    def __init__(self):
        super().__init__('draw')

        self.cmd_vel_publisher1 = self.create_publisher(Twist, "/turtle1/cmd_vel", 10)
        self.cmd_vel_publisher2 = self.create_publisher(Twist, "/turtle2/cmd_vel", 10)
        self.cmd_vel_publisher3 = self.create_publisher(Twist, "/turtle3/cmd_vel", 10)
        
        self.kill_turtle('turtle1')
        
        from rcl_interfaces.msg import ParameterDescriptor
        my_parameter_descriptor = ParameterDescriptor(description='Rysowana litera')


        self.declare_parameter('letter', 'p', my_parameter_descriptor)
        letter_value = self.get_parameter('letter').get_parameter_value().string_value

        if letter_value.lower() == 'k':
            self.spawn_turtle(5.0, 7.0, 0, 'turtle1')
            self.spawn_turtle(5.0, 3.0, 0, 'turtle2')
            self.spawn_turtle(3.0, 3.0, 0, 'turtle3')
            
            self.pose_subscriber = self.create_subscription(Pose, "/turtle1/pose", self.pose_callback_K_down, 10)
            self.pose_subscriber = self.create_subscription(Pose, "/turtle2/pose", self.pose_callback_K_up, 10)
            self.pose_subscriber = self.create_subscription(Pose, "/turtle3/pose", self.pose_callback_K_line, 10)
            self.get_logger().info("Run me on blank window of turtlesim node!")
            self.get_logger().info("Drawing K:")

        else:
            self.spawn_turtle(3.0, 7.0, 0, 'turtle1')
            self.pose_subscriber = self.create_subscription(Pose, "/turtle1/pose", self.pose_callback_P, 10)
            self.get_logger().info("Drawing P:")

    def pose_callback_K_line(self, pose:Pose):
        cmd = Twist()
        cmd.linear.y = 1.5
        self.cmd_vel_publisher3.publish(cmd)

    def pose_callback_K_up(self, pose: Pose):
        cmd = Twist()
        
        cmd.linear.x = -1.0
        cmd.linear.y = 1.0
        

        self.cmd_vel_publisher2.publish(cmd)

    def pose_callback_K_down(self, pose: Pose):
        cmd = Twist()
        cmd.linear.x = -1.0
        cmd.linear.y = -1.0
        if pose.x < 3.1:
            self.kill_turtle('turtle1')
            self.kill_turtle('turtle2')
            self.kill_turtle('turtle3')

        self.cmd_vel_publisher1.publish(cmd)
    
    def pose_callback_P(self, pose: Pose):
        cmd = Twist()
        if pose.theta >= 0 and pose.theta < 3.125:
            cmd.linear.x = 1.0
            cmd.angular.z = 0.7
        
        else:
            cmd.linear.y = 1.0
            if pose.y < 3:
                cmd.linear.x = 0.0
                cmd.linear.y = 0.0    


        self.cmd_vel_publisher1.publish(cmd)
    
    
    
    
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