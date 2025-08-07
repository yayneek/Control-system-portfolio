from setuptools import find_packages, setup


package_name = 'projekt3'

setup(
    name=package_name,
    version='0.0.1',
    packages=[package_name],
    data_files=[
        ('share/ament_index/resource_index/packages', ['resource/' + package_name]),
        ('share/' + package_name, ['package.xml']),
    ],
    install_requires=['setuptools'],
    zip_safe=True,
    maintainer='Your Name',
    maintainer_email='your_email@example.com',
    description='ROS 2 service and client for gripper control',
    license='Apache License 2.0',
    tests_require=['pytest'],
    entry_points={
        'console_scripts': [
            'gripper_server = projekt3.gripper_server:main',
            'gripper_client = projekt3.gripper_client:main',
            'inv_kin = projekt3.inv_kin:main',
        ],
    },
)
