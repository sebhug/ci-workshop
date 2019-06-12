# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.box = "ubuntu/bionic64"

  config.vm.define "ci", primary: true do |ci|
    ci.vm.network "private_network", ip: "192.168.99.100", :name => 'vboxnet0', :adapter => 2
    ci.vm.provision :shell, path: "bootstrap.sh"
    ci.vm.hostname = "ci"
    ci.vm.provider "virtualbox" do |vb|
      vb.memory = "1024"
    end
  end

  config.vm.define "worker", primary: true do |worker|
    worker.vm.network "private_network", ip: "192.168.99.101", :name => 'vboxnet0', :adapter => 2
    worker.vm.provision :shell, path: "bootstrap.sh"
    worker.vm.hostname = "worker"
    worker.vm.provider "virtualbox" do |vb|
      vb.memory = "1024"
    end
  end

end
