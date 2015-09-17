FROM php:5.4

# Preinstall some things that don't change.
RUN apt-get update -q \
  && apt-get install -y apt-utils \
  && apt-get -y install \
    git \
    unzip \
    nano \
    wget \
    apache2 \
    libapache2-mod-php5 \
  && apt-get clean

# Install composer related packages.
RUN cd $HOME \
    && curl -sS https://getcomposer.org/installer | php \
    && mv composer.phar /usr/local/bin/composer

# Install drush.
COPY conf/composer.json /root/composer.json
RUN cd \
    && composer install \
    && drush cc drush

RUN git clone -b master --depth=1 https://github.com/kraftwagen/kraftwagen.git /root/.drush/commands/kraftwagen

COPY scripts/build.sh /root/build.sh
COPY scripts/rm.sh /root/rm.sh
RUN chmod u+x /root/build.sh

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]

