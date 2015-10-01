# -*- mode: ruby -*-
# vi: set ft=ruby :

  # All Vagrant configuration is done here.
  # For a complete reference please see the online documentation at vagrantup.com.
  
# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

#  configure mySQL database server VM and initialize with shell script 
  config.vm.define "db" do |db|
    db.vm.box = "dz0/vivid32srv"
    db.vm.hostname = "mySQLsrv"
    db.vm.network "private_network", type: "dhcp",virtualbox__intnet: "intnet"
    db.vm.provision :shell, path: "loadSQL.sh"
  end

#  configure desktop VM with MonoDevelop and OpenSimulator branch clone with shell script   
  config.vm.define "dev" do |dev|
    dev.vm.box = "box-cutter/ubuntu1404-desktop"
    dev.vm.hostname = "osdev"
    dev.vm.network "private_network", type: "dhcp",virtualbox__intnet: "intnet"
    dev.vm.network "forwarded_port", guest: 9000, host: 9000, protocol: 'tcp'
    dev.vm.network "forwarded_port", guest: 9000, host: 9000, protocol: 'udp'
    dev.vm.provision :shell, path: "loadDEV.sh"
    dev.vm.synced_folder "../gitclones", "/gitclones"
    dev.vm.synced_folder "../OSviewers", "/viewers"
    dev.vm.synced_folder "../OSAssets", "/assets"
    
  end

end
