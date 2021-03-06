## Overview

OsMonoDev is designed to simplify the creation of Ubuntu VM's configured to support the creation of a small OpenSimulator standalone grid.  It uses a Vagrant recipe to provision a Ubuntu desktop virtual machine loaded with monodevelop and a clone of any OpenSimulator branch.  It also configures an Ubuntu server configured as a MySQL server for any of the OpenSimulator servers started on the local network.

osMonoDev is designed to use the following freely available software.  

* VirtualBox ( [www.virtualbox](https://www.virtualbox.org/) )
* Vagrant ( [www.vagrantup](https://www.vagrantup.com/) )
* Ubuntu Desktop & Server(LTS and current versions) ( [www.ubuntu](https://www.ubuntu.com/) )
* Git  ( [www.git](https://nodejs.org/) )
* OpenSimulator   ( [www.opensimulator](http://www.opensimulator.org/) )
* Mono   ( [www.mono](http://www.mono-project.com/) )
* MonoDevelop   ( [www.monodevelop](http://www.monodevelop.com/) )
* Nant   ( [www.nant](http://nant.sourceforge.net/) )
* Avahi   ( [www.avahi](http://www.avahi.org/) )


## Getting Started
These instructions presume that the user has install rights on a current 64 bit machine (& OS) with multiple CPUs and enough memory/disk storage to support running 2 additional VM's.

### Install Packages on the host machine

Each of the packages that will be installed on the host machine offer cross platform compatability.
The rest of these instructions assume you are installing on host machine with a current Ubuntu desktop release installed. 
If your host machine is running OSx or Windows, follow the appropriate instructions found at the linked pages in each of the sections below.

#### VirtualBox
##### Ubuntu Desktop
 
osMonoDev requires VirtualBox 5.0 or later. VirtualBox also requires the installation of kernel modules to manage resources for the virtual machines.
In order to keep these modules up to date, it is recommended that you install DKMS.

    sudo apt-get install dkms
 
Add the oracle repositories to the /etc/apt/sources.list file.

    sudo echo "deb http://download.virtualbox.org/virtualbox/debian vivid contrib" >> /etc/apt/sources.list
 
According to your distribution, replace 'vivid' by 'utopic', 'trusty', 'raring', 'quantal', 'precise', 'lucid'.

Retrieve and add the oracle public key for repository access, then update and install.
    
    wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -
    sudo apt-get update
    sudo apt-get install virtualbox-5.0
##### Other hosts
 ( [VirtualBox Download & Install Instructions](https://www.virtualbox.org/wiki/Downloads) )

#### Vagrant
 ( [Vagrant Download](http://www.vagrantup.com/downloads) )

#### Git
 ( [Ubuntu Install](https://www.digitalocean.com/community/tutorials/how-to-install-git-on-ubuntu-14-04) )

### Setup the Vagrant Project Directory
Vagrant with Virtualbox will create a shared directory where the  "Vagrant up" command is executed.
OpenSimian uses the ~/VagrantBase directory as a home for all of its projects, but you can use what you like.
There are a number of shared directories the virtual machine will expect.   Create them...

    cd ~/VagrantBase
    mkdir gitclones  ( for the opensim branches )
    mkdir OSAssets   ( for opensim OAR and IAR files )
    mkdir Viewers    ( for the viewer sources )

### Customize the branch of OpenSimulator
The source code you will be working with is loaded on the host machine via git clone.
The directory containing the .git file will be shared so both host and VM have access to the working/build base. 
Execute the clone command in the ~/VagrantBase/gitclones directory to insure  proper  sharing.

    cd gitclones
    # clone the base OpenSimulator GIT repository ( uncomment the branch you want)
    # git clone -b master https://github.com/nebadon2025/opensimulator.git
    git clone -b 0.8.1-post-fixes https://github.com/nebadon2025/opensimulator.git

You are responisible for insuring that the branch is actually available in the repository selected.
The examples allow you to clone the lastest production release [0.8.1-post-fixes], or master.

### Load the osMonoDev recipe

    cd ~/VagrantBase
    git clone https://github.com/OpenSimian/osMonoDev.git  

This will create a subdirectory called  osMonoDev

### Start the Virtual Machines

    cd ~/VagrantBase/osMonoDev
    vagrant up

Vagrant will follow the recipe and ask VirtualBox to download/load an Ubunut server VM for the database server with mySQL and a database for OpenSimulator initialized.  A second VM will be created from an Ubuntu desktop image.  This VM will be configured with MonoDevelop and links to the opensimulator GIT repository on the hostto allow source code modifications and building the project. 
Remember, you are user vagrant, password vagrant on each of the VM's.  The mySQL user is set as osUser with password 0p3ns1m1an.

### Build and Configure
Log in to the DEV VM and connect to the base directory ( probably ~/opensimulator).

    cd ~/gitclones/opensimulator
    ./runprebuild.sh
    
    xbuild  { or } monodevelop OpenSim.sln
    

Build the OpenSim project, run the unit tests,  configure the STANDALONE INI files as described @  ( [opensim config](http://opensimulator.org/wiki/Configuration) ) and  start the simulator.  While setting configuration options is not something that fits well in a recipe,  the following walkthrough highlights the minimal changes to get a standalone server up and running, and some optional setting changes we like to make.

#### OpenSim.ini file
    BaseURL = http://osdev.local
    PublicPort = "9000"
    physics = OpenDynamicsEngine     [used for internal testing @ OpenSimian]
    enable_windlight = true          [becuase we like to share the  good looks]
    AllowOSFunctions = true          [theres good stuff there, we want to use it]
    OSFunctionThreatLevel = Severe   [Yes  ALL the good stuff... Dont' be scared]
    ScriptDelayFactor = 0.2          [We dont want to wait]
    ScriptDistanceLimitFactor = 25.0 [We like to build BIG linked objects]
    SensorMaxRange = 256.0           [Find things in all but the farthest corners]
    SensorMaxResults = 32            [Return  a BIG list]
    Enabled = true                   [In the NPC section -- needs a better name  eh?]
    Include-Architecture = "config-include/Standalone.ini"
#### StandaloneCommon.ini file  [in config-include]
    StorageProvider = "OpenSim.Data.MySQL.dll"
    ConnectionString = "Data Source=mysqlsrv.local;Database=opensim;User ID=osUser;Password=0p3ns1m1an;Old Guids=true;"
    gridname = "OpenSimian MonoDev Test"
    gridnick = "osMonoDev"
#### FlotsamCache.ini
There are no changes recommended,  just make sure the default file is renamed.

### Start the Region simulation

    cd ~/gitclones/opensimulator/bin
    mono OpenSim.exe


On the inital startup you will be prompted for basic information about your first region.

    New region name []:  Home
    RegionUUID [06ecbda5....]:               [return to accept default]
    Region Location [1000,1000]:             [return to accept default]
    Internal IP address [0.0.0.0]:
    Internal port [9000]:
    Allow alternate ports [False]: 
    External host name [SYSTEMIP]: 
    New estate name [My Estate]:  OpenSimian
    Estate owner first name [Test]:  Ruth
    Estate owner last name [User]:   OnADot
    Password:                        LetMeIn
    email:
    UserID[]

Your Terminal session is now acting as the simulator console...   Once all of the questions are answered   it should gie you a console promt like 

    Region (Home) # 


## Stay in Synch
Once you have completed the clone of the osMonoDev repository it is easy to stay up to date.

    cd ~/VagrantBase/osMonoDev
    git pull


