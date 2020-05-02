#!/bin/bash
echo "*** Install prerequisites ***"
sudo apt update
sudo apt install -y apache2 expect iperf mariadb-server php php-mysql sysbench unzip
echo "*** Seting up apache / mariadb ***"
sudo systemctl start apache2
sudo systemctl enable apache2
sudo a2enmod rewrite
sudo systemctl restart apache2
sudo systemctl start mariadb
sudo systemctl enable mariadb
sudo mysql_secure_installation <<EOF

n
y
y
y
y
EOF
sudo bash -c 'cat << EOF > /var/www/html/helloworld.html
<!DOCTYPE html>
<html>
    <head><title>Hello World!</title></head>
    <body><h1>Hello World!</h1></body>
</html>
EOF'
echo "*** Setting up mariadb for wordpress ***"
echo "CREATE DATABASE wordpress;" | sudo mysql -u root
echo "CREATE USER 'username'@'localhost' IDENTIFIED BY 'password';" | sudo mysql -u root
echo "GRANT ALL PRIVILEGES ON wordpress.* TO 'username'@'localhost';" | sudo mysql -u root
# create user for wordpress
echo "*** Setting up wordpress ***"
sudo wget https://wordpress.org/wordpress-5.4.zip -O /var/www/html/wordpress-5.4.zip
cd /var/www/html
sudo mv index.html index.html.old
sudo unzip wordpress-5.4.zip
sudo rm -rf wordpress-5.4.zip
sudo chown -R www-data /var/www/html
sudo chgrp -R www-data /var/www/html