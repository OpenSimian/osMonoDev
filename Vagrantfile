# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.
  config.vm.define "dev" do |dev|
    dev.vm.box = "box-cutter/ubuntu1504-desktop"
    dev.vm.provision :shell, path: "bootstrap.sh"
  end
  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.define "db" do |db|
    db.vm.box = "https://atlas.hashicorp.com/ubuntu/boxes/wily32"
    db.vm.provision :shell, path: "loadSQL.sh"
  end


end
