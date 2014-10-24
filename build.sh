#!/bin/bash

# https://registry.hub.docker.com/_/mysql/
# https://registry.hub.docker.com/_/php/

docker build -t phpdock-mysql ./container-mysql
docker build -t phpdock-php ./container-php
