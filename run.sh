#!/bin/bash


# Command explained:
#
# docker = the command
# run = the run command
# --name = the reference name to give to the container
# -e = the argument to pass environment variables.
# -d = run as demon
# mysql = the image to use
#
#docker run --name="phpdock-mysql-run" -e MYSQL_ROOT_PASSWORD=root -d mysql:5.7


# Command explained:
#
# docker = the command
# run = the run command of docker
# -i = keep STDIN open.
# -t = pseudo-tty
# --rm = remove the container when finished
# --name = the reference name to give to the container.
# -v = map a local volume to a container volume.
# phpdock = the name of the image to use
#
docker run -it --rm --name="phpdock-php-run" -e MYNAME=matthias -v /home/vhosts/boxes/phpdock/container-php/src:/var/www/html phpdock-php

# Command explained:
#
# Purposed to link mysql and php container together on run command.
#
# --link some-mysql:mysql = a link between the running some-mysql container instance and the inside mysql reference name.
#     docs: https://docs.docker.com/userguide/dockerlinks/#container-linking
#
# docker run -it --link some-mysql:mysql --rm mysql sh -c 'exec mysql -h"$MYSQL_PORT_3306_TCP_ADDR" -P"$MYSQL_PORT_3306_TCP_PORT" -uroot -p"$MYSQL_ENV_MYSQL_ROOT_PASSWORD"'

