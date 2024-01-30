from setuptools import find_packages
from setuptools import setup

setup(
    name='lttngpy',
    version='7.1.0',
    packages=find_packages(
        include=('lttngpy', 'lttngpy.*')),
)
