#!/bin/bash

VERSION=$1

echo -ne "$/> Installing php version ${VERSION} \n\n"

sudo apt install -y php${VERSION} \
     php${VERSION}-intl \
     php${VERSION}-mbstring \
     php${VERSION}-mbstring \
     php${VERSION}-dom \
     php${VERSION}-pdo \
     php${VERSION}-pgsql \
     php${VERSION}-curl \
     phppgadmin

echo -ne "\n$/> Enabling version ${VERSION}\n\n"

sudo a2dismod php5.6 php7.0 php7.2 php8.0
sudo a2enmod php${VERSION}

echo -ne "\n$/> Restarting Apache2\n\n"

sudo service apache2 restart

echo -ne "\n$/> Updating Alternatives to ${VERSION}\n\n"

sudo update-alternatives --set phar /usr/bin/phar${VERSION}
sudo update-alternatives --set php-config /usr/bin/php-config${VERSION}
sudo update-alternatives --set php /usr/bin/php${VERSION}
sudo update-alternatives --set phpize /usr/bin/phpize${VERSION}
sudo update-alternatives --set phar.phar /usr/bin/phar.phar${VERSION}

echo -ne "\n$/> Current Default Version\n\n"

php --version

echo -ne "\n\n"