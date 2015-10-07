#!/usr/bin/env bash
apt-key add /vagrant/mySQLgnuPGkey
echo "deb http://repo.mysql.com/apt/ubuntu/ vivid mysql-5.6" > /etc/apt/sources.list.d/mysql.list
dpkg -P mysql-server -y

echo " Installing MySQL..    check mysql.txt for log"
apt-get install -y mysql-server

apt-cache show mysql-server

/sbin/iptables  -I INPUT -p tcp --dport 3306 -m state --state NEW,ESTABLISHED -j ACCEPT
/sbin/iptables  -I OUTPUT -p tcp --sport 3306 -m state --state ESTABLISHED -j ACCEPT

echo "[mysqld]" >> /etc/mysql/my.cnf
echo "bind-address = $DBBIND" >> /etc/mysql/my.cnf

service mysql stop 

service mysql start 

echo -e "\n--- Setting up our MySQL user and db ---\n"
mysql -uroot -p$DBPASSWD -e "CREATE DATABASE $DBNAME"
mysql -uroot -p$DBPASSWD -e "grant all privileges on $DBNAME.* to '$DBUSER'@'%' identified by '$DBPASSWD'"
mysql -uroot -p$DBPASSWD -e "FLUSH PRIVILEGES;"



/usr/sbin/mysqld --help --verbose
