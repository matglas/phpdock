FROM php:5.5-apache

# Install mysql dependencies
RUN apt-get update && \
    apt-get -y install mysql-client && a2enmod rewrite && \
    docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-gd-dir=/usr/include/ && \
    docker-php-ext-install gd

# Install composer related packeges
ENV DRUSH_VERSION 6.5.0
RUN cd ~ && curl -sS https://getcomposer.org/installer | php && \
    mv composer.phar /usr/local/bin/composer && \
    export PATH="$HOME/.composer/vendor/bin:$PATH" && \
    composer global require drush/drush:$DRUSH_VERSION --prefer-source && \
    git clone "git://github.com/kraftwagen/kraftwagen.git" /.drush/kraftwagen && drush cc drush

ENV PATH /.composer/vendor/bin:$PATH

# Exporting current path to make tools available when using nsenter.
RUN echo "export PATH=$PATH" > /.bashrc

COPY ./src /var/www/html
