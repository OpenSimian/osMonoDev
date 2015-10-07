#!/usr/bin/env bash
sudo apt-key add mySQLgnuPGkey
sudo echo "deb http://repo.mysql.com/apt/ubuntu/vivid mysql-5.6" >> /etc/apt/sources.list.d/mysql.list
sudo dpkg -P mysql-server -y
sudo apt-get install mysql-server -y


/usr/sbin/mysqld --help --verbose
