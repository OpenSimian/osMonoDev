#!/usr/bin/env bash

# Add the Mono Project GPG signing key and the package repository to your system 
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
echo "deb http://download.mono-project.com/repo/debian wheezy main" | sudo tee /etc/apt/sources.list.d/mono-xamarin.list

apt-get update

echo " Installing git..    check git.txt for log"
apt-get install -y git &> git.txt

echo " Installing mono..    check mono.txt for log"
apt-get install -y mono-complete &> mono.txt

echo " Installing monodev nunuit..    check monodev-nu.txt for log"
apt-get install -y monodevelop-nunit &> monodev-nu.txt

echo " Installing monodev version control..    check monodev-vc.txt for log"
apt-get install -y monodevelop-versioncontrol &> monodev-vc.txt

echo " Installing nant..    check nant.txt for log"
apt-get install -y nant &> nant.txt

cd /home/vagrant
git clone https://github.com/OpenSimian/opensimulator.git

cd opensimulator
./runprebuild.sh
nant

