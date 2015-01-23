#!/bin/bash
#
# @author: Matthias Glastra
#
# Build docker images that are used in the phpdock project.

# Build mysql image with name phpdock-mysql
# Image is based on https://registry.hub.docker.com/_/mysql/
# and the container-mysql contains the Dockerfile.
docker build -t phpdock-mysql ./container-mysql

# Build php image with name phpdock-php
#
# Image is based on https://registry.hub.docker.com/_/php/
# and the container-php contains the Dockerfile.
docker build -t phpdock-php ./container-php
