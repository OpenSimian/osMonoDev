# -*- mode: ruby -*-
# vi: set ft=ruby :

  # All Vagrant configuration is done here.
  # For a complete reference please see the online documentation at vagrantup.com.
  
# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  
  config.vm.provider :virtualbox do |vb|
    # change the network card hardware for better performance
    vb.customize ["modifyvm", :id, "--nictype1", "virtio" ]
    vb.customize ["modifyvm", :id, "--nictype2", "virtio" ]

    # suggested fix for slow network performance
    # see https://github.com/mitchellh/vagrant/issues/1807
    vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    vb.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
  end

#  configure mySQL database server VM and initialize with shell script 
  config.vm.define "db" do |db|
    db.vm.box = "dz0/vividSQLsrv32"
    db.vm.hostname = "mySQLsrv"

    db.vm.network "private_network", ip: "192.168.50.4"
    db.vm.provision :shell, path: "loadSQL.sh"
  end

#  configure desktop VM with MonoDevelop and OpenSimulator branch clone with shell script   
  config.vm.define "dev" do |dev|
    dev.vm.box = "box-cutter/ubuntu1404-desktop"
    dev.vm.hostname = "osdev"

    dev.vm.network "private_network", ip: "192.168.50.5"
    dev.vm.provision :shell, path: "loadDEV.sh"
    dev.vm.synced_folder "../gitclones", "/gitclones"
    dev.vm.synced_folder "../OSviewers", "/viewers"
    dev.vm.synced_folder "../OSAssets", "/assets"
    
  end

end
