## Overview

OsMonoDev is designed to simplify the creation and management of Ubuntu VM's preloaded with OpenSimulator and MonoDevelop
It uses a Vagrant recipe to provision a Ubuntu 15.04 desktop virtual machine through Virtualbox.  Once the VM is created,
it is loaded with the packages and source code to allow developers to edit the OpenSimian clone of OpenSimulator. 

Opensimian Grid Manager currently requires the following freely available software.
* Ubuntu Desktop (LTS and current versions) ( [www.ubuntu](https://www.ubuntu.com/) )
* VirtualBox ( [www.virtualbox](https://www.virtualbox.org/) )
* Vagrant ( [www.vagrantup](https://www.vagrantup.com/) )
* Git  ( [www.git](https://nodejs.org/) )
* OpenSimulator   ( [www.opensimulator](http://www.opensimulator.org/) )
* Mono   ( [www.mono](http://www.mono-project.com/) )
* MonoDevelop   ( [www.monodevelop](http://www.monodevelop.com/) )


## Getting Started
These instructions presume that the user has install rights on a current 64 bit machine (& OS) with multiple CPUs and enough memory/disk storage to support running a VM.

### Install VirtualBox
 ( [Ubuntu Install Instructions](https://help.ubuntu.com/community/VirtualBox/Installation) )

### Install Vagrant
 ( [Vagrant Download](http://www.vagrantup.com/downloads) )

### Set Vagrant Project Directory
Vagrant with Virtualbox will create a shared directory where the  "Vagrant up" command is executed.
OpenSimian uses the ~/VagrantBase directory as a home for all of its projects, but you can use what you like.

### Load the osMonoDev recipe
 cd ~/VagrantBase
 git clone https://github.com/OpenSimian/osMonoDev.git  (This will create a subdirectory called  osMonoDev)

### Start Me Up
 cd ~/VagrantBase/osMonoDev
 vagrant up



