# -*- mode: ruby -*-
# vi: set ft=ruby :

  # All Vagrant configuration is done here.
  # For a complete reference please see the online documentation at vagrantup.com.
  
# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
auto_config: false
#  configure mySQL database server VM and initialize with shell script 
  config.vm.define "db" do |db|
    db.vm.box = "dz0/vivid32srv"
    db.vm.hostname = "mySQLsrv"
    
# change the network card hardware for better performance
    db.customize ["modifyvm", :id, "--nictype1", "virtio" ]
    db.customize ["modifyvm", :id, "--nictype2", "virtio" ]
    
    db.vm.network "private_network", type: "dhcp"
    db.vm.provision :shell, path: "loadSQL.sh"
  end

#  configure desktop VM with MonoDevelop and OpenSimulator branch clone with shell script   
  config.vm.define "dev" do |dev|
    dev.vm.box = "box-cutter/ubuntu1404-desktop"
    dev.vm.hostname = "osdev"
    dev.vm.network "private_network", type: "dhcp"
    dev.vm.provision :shell, path: "loadDEV.sh"
    dev.vm.synced_folder "../gitclones", "/gitclones"
    dev.vm.synced_foloder "../OSviewers", "/viewers"
    dev.vm.synced_folder "../OSAssets", "/assets"
    
  end

end
