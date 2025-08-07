from setuptools import find_packages, setup

package_name = 'projekt4'

setup(
    name=package_name,
    version='0.0.0',
    packages=find_packages(exclude=['test']),
    data_files=[
        ('share/ament_index/resource_index/packages',
            ['resource/' + package_name]),
        ('share/' + package_name, ['package.xml']),
    ],
    install_requires=['setuptools'],
    zip_safe=True,
    maintainer='Jan Piliszczuk',
    maintainer_email='janek.piliszczuk@gmail.com',
    description='Ostatni projekt',
    license='TODO: License declaration',
    tests_require=['pytest'],
    entry_points={
        'console_scripts': [
        'draw_shape_server = projekt4.draw_shape_server:main'
        ],
    },
)
