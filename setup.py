from setuptools import find_packages, setup

setup(
    name='hello_service',
    description='Hello Service',
    packages=find_packages(),
    version='0.0.1',
    install_requires=[
        'Flask',
    ],
)
