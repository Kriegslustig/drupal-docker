#!/bin/bash

apt-get install -y \
  lamp-server^ \
  vim \
  curl \
  php5-curl \
  cron \
  git \
  python \

# Set up supervisord
mkdir -p /etc/supervisord/
mkdir /var/log/supervisord
cp /provision/conf/supervisor.conf /etc/supervisord.conf
cp /provision/service/* /etc/supervisord/

# Install supervisord
curl https://bootstrap.pypa.io/ez_setup.py -o - | python
easy_install supervisor

# Set up configs
cp /provision/conf/php.ini /etc/php5/apache2/php.ini
cp /provision/conf/my.cnf /etc/mysql/my.cnf
cp /provision/conf/apache2.conf /etc/apache2/
cp /provision/conf/000-default.conf /etc/apache2/sites-available/

# Set up mysqld with config
mysql_install_db

# Install Compose
php -r "readfile('https://getcomposer.org/installer');" | php
mv composer.phar /usr/local/bin/composer

# Install Drush
# TODO: Check if this even works (env stuff)
composer global require drush/drush

rm -r /provision

