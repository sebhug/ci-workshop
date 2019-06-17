# CI/ CD Workshop

## Vagrant

First, make sure your development machine has
[VirtualBox](https://www.virtualbox.org/)
installed. After this,
[download and install the appropriate Vagrant package for your OS](https://www.vagrantup.com/downloads.html).

### Host only setup for Vagrant VMs

Modify the host only network configuration in the Vagrantfile to match the setup for your host OS.

For Windows:

```yml
...
ci.vm.network "private_network", ip: "192.168.99.100", :name => 'VirtualBox Host-Only Ethernet Adapter', :adapter => 2
...
worker.vm.network "private_network", ip: "192.168.99.101", :name => 'VirtualBox Host-Only Ethernet Adapter', :adapter => 2
...
```

For MacOS and Linux

```yml
...
ci.vm.network "private_network", ip: "192.168.99.101", :name => 'vboxnet0', :adapter => 2
...
worker.vm.network "private_network", ip: "192.168.99.101", :name => 'vboxnet0', :adapter => 2
...
```

If you still have issues with the Host only network, check the device name of your virtualbox host-only network adapter

### Basic Vagrant commands

Start vagrant machines:

```sh
vagrant up
```

Starts `ci` and `worker` machine

```sh
vagrant up ci worker
```

Stop vagrant machines:

```sh
vagrant halt
```

Remove vagrant machines:

```sh
vagrant destroy
```

Update vagrant box:

```sh
vagrant box update
```

## Traefik

### Generating password for admin UI

``` sh
echo $(htpasswd -nbB <USER> "<PASS>") | sed -e s/\\$/\\$\\$/g
```

## Jenkins

## Automatic plugin deployment

If you haven't already a list of the needed plugins, the best way iys to setup a Jenkins, install all needed Plugins and curl the Plugin endpoint.

- Start Jenkins inside docker:

```sh
docker run --name jenkins -p 8080:8080 jenkins/jenkins:lts-alpine
```

- Initialize Jenkins manual and install all needed Plugins
- Get the plugin list via curl and [jq](https://stedolan.github.io/jq/)

```sh
curl -s -k "http://${jenkins_user}:${jenkins_pwd}@${jenkins_url}:${jenkins_port}/pluginManager/api/json?depth=1" | jq -r '.plugins[].shortName' | tee plugins.txt
```

## Rebuild image and redeploy

```sh
docker-compose up -d --no-deps --build jenkins
```
