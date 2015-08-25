# About
This is just a demo setup to show how the project can be started from the src 
folder. This is important for our kraftwagen setup. It has a docker-compose.yml 
in the src. This file can build the php container that is above it. And run the 
container from there.

1. It mounts the root of the project folder (also know as kraftwagen root).
2. It uses drush kw-s to setup the project.
3. Then it creates a build from src.
4. And because its a demo we remove it at the end.

# Containers
The php container Dockerfile should be available for development but could be a 
image that developers could be running.

# Obstacles
When run from the src container the container get the name src_*.
You can overcome this by running it from the kraftwagen root with:
docker-compose -p phpdock up

The -p provides a context specific project name.

All explicit commands need to be run with -p. So if you want to run something
on the ctl container you neet to do docker-compose -p phpdock run ctl /bin/bash

We could pick this up from the root name with a wrapper script.
