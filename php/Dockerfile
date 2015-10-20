# Image is based on https://registry.hub.docker.com/u/phusion/baseimage/
# and the php contains the Dockerfile.
FROM matglas/phpdock-base:latest

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

# Inspired by Tutum Apache PHP.
#
# https://registry.hub.docker.com/u/tutum/apache-php/dockerfile/
#
ENV DEBIAN_FRONTEND noninteractive

# PHP Packages.
RUN apt-get update && apt-get -y install libapache2-mod-php5 apache2

RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf

EXPOSE 80

##
# Now all our stuff.
##

# Prepare apache
RUN a2enmod rewrite alias

# Exporting current path to make tools available when using nsenter.
RUN echo "export PATH=$PATH" >> $HOME/.bashrc \
    && echo "export TERM=xterm" >> $HOME/.bashrc

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN mkdir /etc/service/apache
ADD services/apache.sh /etc/service/apache/run