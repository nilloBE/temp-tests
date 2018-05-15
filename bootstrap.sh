#!/bin/sh
sudo apt-get -y update
sudo apt-get -y install apache2 php5 php5-memcached memcached
sudo apt-get -y install git
git clone https://github.com/nilloBE/temp-tests
cd google-cloud-datastore-php
sudo chmod -R 777 /var/www
sudo cp calldatastore.php /var/www/html
sudo cp form.html /var/www/html
sudo bash -c "echo 'GOOGLE_APPLICATION_CREDENTIALS=/home/juan_lage/credentials/web-autocomplete-01-e910d561d520.json' >> /etc/environment"
cd /var/www/html
sudo bash -c "curl -sS https://getcomposer.org/installer | php"
sudo php composer.phar require google/auth
sudo php composer.phar require google/cloud
