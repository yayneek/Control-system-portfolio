from launch import LaunchDescription
from launch_ros.actions import Node

def generate_launch_description():
    return LaunchDescription([
        Node(
            package ='lab2_to_send',
            executable = 'draw',
            name = 'draw'
        )
    ])