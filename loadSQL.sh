#!/usr/bin/env bash

debconf-set-selections <<< 'mysql-server mysql-server/root_password password 0p3ns1m1an'
debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password 0p3ns1m1an'

# Install the base packages...  pipe the output to the InstallLogs directory
mkdir InstallLogs

# Update the repository package listings
echo " Updating repositories ..    check aptUpgrade.txt for log"
apt-get update  &> InstallLogs/aptUpdate.txt

# x-terminal-emulator -e top

echo " Installing MySQL..    check mysql.txt for log"
apt-get install -y mysql-server &> InstallLogs/mysql.txt

apt-cache show mysql-server




