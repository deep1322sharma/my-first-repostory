#!/bin/bash

sudo apt install software-properties-common -y

sudo add-apt-repository ppa:ondrej/php -y

 sudo apt update -y

sudo apt install libapache2-mod-fcgid -y

sudo apt install php7.0 php7.0-fpm php7.0-mysql libapache2-mod-php7.0 -y

sudo apt install php7.2 php7.2-fpm php7.2-mysql libapache2-mod-php7.2 -y

sudo apt install php7.4 php7.4-fpm php7.4-mysql libapache2-mod-php7.4 -y

sudo apt install php8.1 php8.1-fpm php8.1-mysql libapache2-mod-php8.1 -y

sudo apt install php8.2 php8.2-fpm php8.2-mysql libapache2-mod-php8.2 -y


sudo systemctl start php7.0-fpm
