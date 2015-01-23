# About
This project is made as a test to see how to work with Docker. Through many tutorials and documentation pages I'm trying
to setup a project that could be reused inside our company. This could be either for development or to run a CI suite
for our projects.

# Containers
This project has now 2 containers

## PHP
The php container is build from the official docker php registry found here.
https://registry.hub.docker.com/_/php/

## MySql
The mysql container is build from the official docker php registry found here.
https://registry.hub.docker.com/_/mysql/

# Tools
The following tools are explicitly installed.

- mysql
- php 5.5 w/ apache
- mysql-client
- drush
- krafwagen (drush commands)

# Fixes to remember
During my struggle with Docker and getting to know the way certain things work these are some lessons I learned written
down in a short manner.

- You need to export $PATH to a .bashrc to be able to use the tools you installed through nsenter. See php/Dockerfile.

# Todos
There are many aspect that could be improved here is a list.

- Fix missing gd extension on php container.
- Setup a configuration file (projectmanifest)
  - Project name
  - Project folder
  - Project type (kraftwagen, drupal rootk, wordpress, php)
  - Ip address
- Include mysql configuration in my.cnf
- Create a data container.
- Create a solr container
- Fixing a but with kraftwagen where symlinks are not relative. This creates a situation where we need to reference the
  full host path.

# References

PHP
- https://registry.hub.docker.com/_/php/
- https://github.com/docker-library/php/blob/master/5.5/apache/Dockerfile

Mysql
- https://registry.hub.docker.com/_/mysql/
- https://github.com/docker-library/mysql/blob/master/5.7/Dockerfile

nsenter
- http://blog.docker.com/tag/nsenter/
- https://github.com/jpetazzo/nsenter

Docker linking.
- https://docs.docker.com/userguide/dockerlinks/#container-linking
