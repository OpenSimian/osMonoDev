#!/usr/bin/env bash
# Variables
DBBIND=::
DBNAME=opensim
DBUSER=osUser
DBPASSWD=0p3ns1m1an

service mysql stop 

service mysql start 

echo -e "\n--- Setting up our MySQL user and db ---\n"
mysql -uroot -p$DBPASSWD -e "CREATE DATABASE $DBNAME"
mysql -uroot -p$DBPASSWD -e "grant all privileges on $DBNAME.* to '$DBUSER'@'%' identified by '$DBPASSWD'"
mysql -uroot -p$DBPASSWD -e "FLUSH PRIVILEGES;"

service avahi-daemon stop
service avahi-daemon start

/usr/sbin/mysqld --help --verbose
