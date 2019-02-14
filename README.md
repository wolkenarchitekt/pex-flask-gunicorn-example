Pex Flask example
=================

This example shows how to package a Flask application with pex and run the resulting file 
with gunicorn.
It can be run using system Python or using Docker.

Run examples
------------

Package and run using system python:

```
make pex
```

Package and run using Docker:

```
make docker-build pex-docker
```
