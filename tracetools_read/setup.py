from setuptools import find_packages
from setuptools import setup

package_name = 'tracetools_read'

setup(
    name=package_name,
    version='0.1.0',
    packages=find_packages(exclude=['test']),
    data_files=[
        ('share/' + package_name, ['package.xml']),
    ],
    install_requires=['setuptools'],
    maintainer=(
        'Christophe Bedard, '
        'Ingo Lütkebohle'
    ),
    maintainer_email=(
        'fixed-term.christophe.bourquebedard@de.bosch.com, '
        'ingo.luetkebohle@de.bosch.com'
    ),
    author='Christophe Bedard',
    author_email='fixed-term.christophe.bourquebedard@de.bosch.com',
    # url='',
    keywords=['ROS'],
    description='Tools for reading trace',
    license='Apache 2.0',
    tests_require=['pytest'],
)