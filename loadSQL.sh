#!/usr/bin/env bash

# Variables

DBHOST=localhost
DBNAME=opensim
DBUSER=osUser
DBPASSWD=0p3ns1m1an

echo -e "\n--- Install MySQL specific packages and settings ---\n"
echo "mysql-server mysql-server/root_password password $DBPASSWD" | debconf-set-selections
echo "mysql-server mysql-server/root_password_again password $DBPASSWD" | debconf-set-selections

# Install the base packages...  pipe the output to the InstallLogs directory
mkdir InstallLogs

# Update the repository package listings
echo " Updating repositories ..    check aptUpgrade.txt for log"
apt-get update  &> InstallLogs/aptUpdate.txt

# x-terminal-emulator -e top

echo " Installing MySQL..    check mysql.txt for log"
apt-get install -y mysql-server &> InstallLogs/mysql.txt

sed -i "s/^bind-address/#bind-address/" /etc/mysql/my.cnf

apt-cache show mysql-server

update-rc.d mysql defaults

service mysql start

echo -e "\n--- Setting up our MySQL user and db ---\n"
mysql -uroot -p$DBPASSWD -e "CREATE DATABASE $DBNAME"
mysql -uroot -p$DBPASSWD -e "grant all privileges on $DBNAME.* to '$DBUSER'@'localhost' identified by '$DBPASSWD'"
