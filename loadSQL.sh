#!/usr/bin/env bash

# Variables
DBBIND=::
DBNAME=opensim
DBUSER=osUser
DBPASSWD=0p3ns1m1an

echo -e "\n--- Install MySQL specific repositories so apt-get returns latest ---\n"
echo "mysql-server mysql-server/root_password password $DBPASSWD" | debconf-set-selections
echo "mysql-server mysql-server/root_password_again password $DBPASSWD" | debconf-set-selections

# Install the base packages...  pipe the output to the InstallLogs directory
mkdir InstallLogs

# Update the repository package listings
echo " Updating repositories ..    check aptUpgrade.txt for log"
apt-get update  &> InstallLogs/aptUpdate.txt

echo " Installing zeroConf..    check zeroConf.txt for log"
apt-get install -y avahi-daemon avahi-discover &> InstallLogs/zeroConf.txt
echo " StartatBoot zeroConf..    "
update-rc.d avahi-daemon defaults

echo " Installing nmap..    check nmap.txt for log"
apt-get install -y nmap &> InstallLogs/nmap.txt

echo " Installing MySQL..    check mysql.txt for log"
apt-get install -y mysql-server  mysql-client &> InstallLogs/mysql.txt

apt-cache show mysql-server

/sbin/iptables  -I INPUT -p tcp --dport 3306 -m state --state NEW,ESTABLISHED -j ACCEPT
/sbin/iptables  -I OUTPUT -p tcp --sport 3306 -m state --state ESTABLISHED -j ACCEPT

echo "[mysqld]" >> /etc/mysql/my.cnf
echo "bind-address = $DBBIND" >> /etc/mysql/my.cnf

service mysql stop 
cp /usr/share/zoneinfo/Navajo /etc/localtime

service mysql start 

echo -e "\n--- Setting up our MySQL user and db ---\n"
mysql -uroot -p$DBPASSWD -e "CREATE DATABASE $DBNAME"
mysql -uroot -p$DBPASSWD -e "grant all privileges on $DBNAME.* to '$DBUSER'@'%' identified by '$DBPASSWD'"
mysql -uroot -p$DBPASSWD -e "FLUSH PRIVILEGES;"

/usr/sbin/update-rc.d mysql defaults

/usr/sbin/mysqld --help --verbose
