# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.box = "ubuntu/bionic64"

  config.vm.define "ci", primary: true do |ci|
    ci.vm.network "private_network", ip: "192.168.99.100", :adapter => 2
    ci.vm.provision :shell, path: "bootstrap.sh"
    ci.vm.hostname = "ci"
    ci.vm.provider "virtualbox" do |vb|
      vb.memory = "4096"
    end
  end

  config.vm.define "worker" do |worker|
    worker.vm.network "private_network", ip: "192.168.99.101", :adapter => 2
    worker.vm.hostname = "worker"
    worker.vm.provider "virtualbox" do |vb|
      vb.memory = "2048"
    end
  end

end     
