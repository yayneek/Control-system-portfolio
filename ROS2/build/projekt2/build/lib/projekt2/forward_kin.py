import rclpy
from rclpy.node import Node
import tf2_ros
from geometry_msgs.msg import TransformStamped
from geometry_msgs.msg import PoseStamped
from sensor_msgs.msg import JointState
import numpy as np


class ForwardKin(Node):
    def __init__(self):
        super().__init__('forward_kin')
        self.subscription = self.create_subscription(JointState, '/joint_states', self.listener_callback, 10)
        self.publisher = self.create_publisher(PoseStamped, '/fwd_kin', 10)
        self.br = tf2_ros.TransformBroadcaster(self)
        
    def sgn(self, x):
        if x < 0:
            return -1
        elif x == 0:
            return 0
        else:
            return 1


    def listener_callback(self, msg):
        joint_values = msg.position
        
        l1 = 0.9
        l2 = 0.6
        l3 = 0.6
        r1 = np.array([0, 0, l1])
        r2 = np.array([0, l2, 0])
        r3 = np.array([0, l3, 0])
        
        R1 = np.array([
            [np.cos(joint_values[0]), -np.sin(joint_values[0]), 0],
            [np.sin(joint_values[0]), np.cos(joint_values[0]), 0],
            [0, 0, 1]
        ])
        R2 = np.array([
            [1, 0 , 0],
            [0, np.cos(joint_values[1]), -np.sin(joint_values[1])],
            [0, np.sin(joint_values[1]), np.cos(joint_values[1])]
        ])
        R3 = np.array([
            [1, 0 , 0],
            [0, np.cos(joint_values[2]), -np.sin(joint_values[2])],
            [0, np.sin(joint_values[2]), np.cos(joint_values[2])]
        ])

        effector_position = np.dot(R1, r1 + np.dot(R2, r2 + np.dot(R3, r3)))
        orientation = np. dot(np.dot(R1, R2), R3)
        
        n = 1/2*np.sqrt(orientation[0,0]+orientation[1,1]+orientation[2,2]+1)
        e = 1/2 * np.array([self.sgn(orientation[2,1] - orientation[1,2]) * np.sqrt(orientation[0,0] - orientation[1,1] - orientation[2,2] + 1), self.sgn(orientation[0,2] - orientation[2,0]) * np.sqrt(orientation[1,1] - orientation[0,0] - orientation[2,2] + 1), self.sgn(orientation[1, 0] - orientation[0,1]) * np.sqrt(orientation[2,2] - orientation[1,1] - orientation[0,0] + 1)]) 
        q = np.append(e, n)
        pose = PoseStamped()
        pose.header.frame_id = "Base"
        pose.pose.position.x = effector_position[0]
        pose.pose.position.y = effector_position[1]
        pose.pose.position.z = effector_position[2]
        pose.pose.orientation.x = q[0]
        pose.pose.orientation.y = q[1]
        pose.pose.orientation.z = q[2]
        pose.pose.orientation.w = q[3]
        self.publisher.publish(pose)
        self.get_logger().info("\nTCP: \nPosition\n" + str(effector_position) + "\nOrientation \n" +str(q) )
        
        t = TransformStamped()
        t.header.stamp = self.get_clock().now().to_msg()
        t.header.frame_id = 'Base'
        t.child_frame_id = 'tcp'

        t.transform.translation.x = effector_position[0]
        t.transform.translation.y = effector_position[1]
        t.transform.translation.z = effector_position[2]

        t.transform.rotation.x = q[0]
        t.transform.rotation.y = q[1]
        t.transform.rotation.z = q[2]
        t.transform.rotation.w = q[3]
        self.br.sendTransform(t)
    



def main(args=None):
    rclpy.init(args=args)
    node = ForwardKin()
    rclpy.spin(node)
    rclpy.shutdown()

if __name__ == '__main__':
    main()