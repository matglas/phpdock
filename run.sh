#!/bin/bash
#
# @author: Matthias Glastra
#

#
# Problem running with symlinks. Can't find kraftwagen root with drush kw-id.
#
# Run mysql docker container (phpdock-mysql) with mysql 5.7 and root password set to root.
#   This container is running directly form the registry image without a build.
#
# Command explained:
#
# docker = the command
# run = the run command
# --name = the reference name to give to the container
# -e = the argument to pass environment variables.
# -d = run as demon
# mysql = the image to use
#
docker run --name="phpdock-mysql" -e MYSQL_ROOT_PASSWORD=root -d mysql:5.7

# Run php docker container with src as webroot.
#
# Command explained:
#
# docker = the command
# run = the run command of docker
# -i = keep STDIN open.
# -t = pseudo-tty
# --rm = remove the container when finished
# --name = the reference name to give to the container.
# -e = Environment variables.
# -v = map a local volume to a container volume.
# phpdock = the name of the image to use
#
docker run -it --rm --name="phpdock-php" \
    --link phpdock-mysql:mysql \
    -v /home/vhosts/boxes/phpdock/src/build:/var/www/html \
    -v /home/vhosts/boxes/phpdock/src:/home/vhosts/boxes/phpdock/src \
    phpdock-php

