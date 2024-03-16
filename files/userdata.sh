#!/bin/bash
sudo -- sh -c ' echo "127.0.0.1 `hostname`" >> /etc/hosts '
sudo apt-get update -y
sleep 20
#sudo apt-get install mysql-client -y
sudo apt-get install apache2 apache2-utils -y
sudo apt-get install ghostscript libapache2-mod-php -y
sudo apt-get install mysql-server -y
sudo apt install software-properties-common -y
sudo add-apt-repository ppa:ondrej/php -y
sudo apt-get install php php-bcmath php-curl php-imagick php-intl php-json php-mbstring php-mysql php-xml php-zip -y
sudo sed -i 's/#$nrconf{restart} = '"'"'i'"'"';/$nrconf{restart} = '"'"'a'"'"';/g' /etc/needrestart/needrestart.conf
sudo apt-get install php8.1-mysqli -y 
# sudo apt-get install php8 -y
# sudo apt-get install php8 libapache2-mod-php8 php8-mcrypt php8-curl php8-gd php8-xmlrp -y
# sudo apt-get install php8-mysqlnd-ms -y
sudo service apache2 restart -y
sudo wget -c http://wordpress.org/latest.tar.gz
sudo tar -xzvf latest.tar.gz
# sudo wget -c http://wordpress.org/wordpress-5.1.1.tar.gz
# sudo tar -xzvf wordpress-5.1.1.tar.gz
sleep 20
sudo mkdir -p /var/www/html/
sudo rsync -av wordpress/* /var/www/html/
# sudo rsync -av wordpress/* /var/www/html/
sudo chown -R www-data:www-data /var/www/html/
sudo chmod -R 755 /var/www/html/
sudo cp /var/www/html/wp-config-sample.php /var/www/html/wp-config.php
sudo service apache2 restart -y
sleep 20
