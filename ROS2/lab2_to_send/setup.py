import os
from setuptools import find_packages, setup
from glob import glob
package_name = 'lab2_to_send'

setup(
    name=package_name,
    version='0.0.0',
    packages=find_packages(exclude=['test']),
    data_files=[
        ('share/ament_index/resource_index/packages',
            ['resource/' + package_name]),
        ('share/' + package_name, ['package.xml']),
        ('share/'+ package_name + '/launch', glob('launch/*.launch.py'))
    ],
    install_requires=['setuptools'],
    zip_safe=True,
    maintainer='JanPiliszczuk',
    maintainer_email='01150144@pw.edu.pl',
    description='TODO: Package description',
    license='Apache-2.0',
    tests_require=['pytest'],
    entry_points={
        'console_scripts': [
        "pose_subscriber = lab2_to_send.pose_subscriber:main",
        "draw = lab2_to_send.draw:main"
        ],
    },
)
