# CI/ CD Workshop

## Vagrant

First, make sure your development machine has
[VirtualBox](https://www.virtualbox.org/)
installed. After this,
[download and install the appropriate Vagrant package for your OS](https://www.vagrantup.com/downloads.html).

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
