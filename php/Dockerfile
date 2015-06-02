# Image is based on https://registry.hub.docker.com/u/phusion/baseimage/
# and the php contains the Dockerfile.
FROM phusion/baseimage:0.9.16

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]


# Preinstall some things that don't change.
RUN apt-get update \
  && apt-get install -y apt-utils \
  && apt-get -y install \
    git \
    unzip \
    nano \
  && apt-get clean

# Install composer related packages
ENV DRUSH_VERSION 6.5.0
RUN cd ~ && curl -sS https://getcomposer.org/installer | php \
    && mv composer.phar /usr/local/bin/composer \
    && export PATH="$HOME/.composer/vendor/bin:$PATH" \
    && composer global require drush/drush:$DRUSH_VERSION --prefer-source \
    && drush cc drush

# Install kraftwagen
ENV KRAFTWAGEN_REPO git://github.com/kraftwagen/kraftwagen.git
RUN git clone "$KRAFTWAGEN_REPO" $HOME/.drush/kraftwagen

# Prepare for gd
RUN apt-get update \
  && apt-get -y install \
    libpng12-dev \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
  && apt-get clean \
  && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ --with-png-dir=/usr/include/ \
  && docker-php-ext-install gd

# Prepare for PDO and MySql.
RUN docker-php-ext-install pdo pdo_mysql \
  && apt-get update \
  && apt-get install -y mysql-client php5-mysql \
  && apt-get clean

# Prepare apache
RUN a2enmod rewrite

# Exporting current path to make tools available when using nsenter.
ENV PATH $HOME/.composer/vendor/bin:$PATH
RUN echo "export PATH=$PATH" > /.bashrc

COPY config/php.ini /usr/local/lib/


# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*