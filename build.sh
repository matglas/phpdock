#!/bin/bash
#
# @author: Matthias Glastra
#
# Build docker images that are used in the phpdock project.

# Build mysql image with name phpdock-mysql
#
# Image is based on https://registry.hub.docker.com/_/mysql/
# and the mysql contains the Dockerfile.
docker build -t phpdock-mysql ./mysql

# Build php image with name phpdock-php
#
# Image is based on https://registry.hub.docker.com/_/php/
# and the php contains the Dockerfile.
docker build -t phpdock-php ./php
