# Image is based on https://registry.hub.docker.com/u/phusion/baseimage/
# and the php contains the Dockerfile.
FROM phusion/baseimage:0.9.16

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

# Run updates.
RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get clean

# Preinstall some things that don't change.
RUN apt-get update -q \
  && apt-get install -y apt-utils \
  && apt-get -y install \
    git \
    unzip \
    nano \
    php5 \
  && apt-get clean

# Install composer related packages.
ENV PATH $PATH:$HOME/.composer/vendor/bin
RUN cd $HOME \
    && curl -sS https://getcomposer.org/installer | php \
    && mv composer.phar /usr/local/bin/composer

# Install drush.
ENV DRUSH_VERSION 6.5.0
RUN composer global require drush/drush:$DRUSH_VERSION --prefer-source \
    && drush cc drush

# Install kraftwagen.
ENV KRAFTWAGEN_REPO git://github.com/kraftwagen/kraftwagen.git
RUN git clone "$KRAFTWAGEN_REPO" $HOME/.drush/kraftwagen



# Exporting current path to make tools available when using nsenter.
RUN echo "export PATH=$PATH" >> $HOME/.bashrc \
    && echo "export TERM=xterm" >> $HOME/.bashrc

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
