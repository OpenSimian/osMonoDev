#!/usr/bin/env bash

# Add the Mono Project GPG signing key and the package repository to your system 
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
echo "deb http://download.mono-project.com/repo/debian wheezy main" | sudo tee /etc/apt/sources.list.d/mono-xamarin.list

# Install the base packages...  pipe the output to the InstallLogs directory
mkdir InstallLogs

# Set the local timezone and start to synch time so timestamps between vms are close
cp /usr/share/zoneinfo/Navajo /etc/localtime

# Update the repository package listings
echo " Updating repositories after Mono additions..    check aptUpgrade.txt for log"
apt-get update  &> InstallLogs/aptUpdate.txt

# x-terminal-emulator -e top

echo " Installing git..    check git.txt for log"
apt-get install -y git &> InstallLogs/git.txt
git --version

echo " Installing mono..    check mono.txt for log"
apt-get install -y mono-complete &> InstallLogs/mono.txt
mono --version

echo " Installing monodev nunuit..    check monodev-nu.txt for log"
apt-get install -y monodevelop-nunit &> InstallLogs/monodev-nu.txt

echo " Installing monodev version control..    check monodev-vc.txt for log"
apt-get install -y monodevelop-versioncontrol &> InstallLogs/monodev-vc.txt
monodevelop --version

echo " Installing nant..    check nant.txt for log"
apt-get install -y nant &> InstallLogs/nant.txt
nant -help

# clone the base OpenSimulator GIT repository ( uncomment the branch you want)
# git clone -b master https://github.com/nebadon2025/opensimulator.git
git clone -b 0.8.1-post-fixes https://github.com/nebadon2025/opensimulator.git

# build the solution file
cd opensimulator
./runprebuild.sh

# run nant build
nant

# ensure access permissions
chown -R vagrant ../opensimulator
