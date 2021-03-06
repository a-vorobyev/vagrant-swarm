# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://vagrantcloud.com/search.
  # config.vm.box = "ubuntu/xenial64"
  config.vm.box = "ubuntu/bionic64"

  config.vm.provider "virtualbox" do |v|
    v.memory = 1024
    v.cpus = 2
    v.default_nic_type = "virtio"
  end

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # NOTE: This will enable public access to the opened port
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine and only allow access
  # via 127.0.0.1 to disable public access
  # config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # config.ssh.insert_key = false

  config.vm.define "rider" do |r|
    # r.vm.box = "ubuntu/bionic64"
    r.vm.hostname = "rider"
    r.vm.provider "virtualbox" do |v|
      v.memory = 512
      v.cpus = 1
    end
    r.vm.network "private_network", ip: "10.10.10.9"
    r.vm.provision "docker", run: 'once', type:"ansible" do |ansible|
      ansible.playbook = "provision/docker.yml"
      # ansible.install_mode = :pip
      ansible.extra_vars = {
        "ansible_python_interpreter" => "/usr/bin/python3",
        "machines" => [
          { 'name' => 'horse1', 'ip' => '10.10.10.10', 'key' => '/vagrant/.vagrant/machines/horse1/virtualbox/private_key' },
          { 'name' => 'horse2', 'ip' => '10.10.10.11', 'key' => '/vagrant/.vagrant/machines/horse2/virtualbox/private_key' },
          { 'name' => 'horse3', 'ip' => '10.10.10.12', 'key' => '/vagrant/.vagrant/machines/horse3/virtualbox/private_key' }
        ]
      }
      ansible.verbose = true
    end
  end

  config.vm.define "horse1" do |h1|
    h1.vm.hostname = "horse1"
    h1.vm.network "private_network", ip: "10.10.10.10"
  end

  config.vm.define "horse2" do |h2|
    h2.vm.hostname = "horse2"
    h2.vm.network "private_network", ip: "10.10.10.11"
  end

  config.vm.define "horse3" do |h2|
    h2.vm.hostname = "horse3"
    h2.vm.network "private_network", ip: "10.10.10.12"
  end

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  # config.vm.provider "virtualbox" do |vb|
  #   # Display the VirtualBox GUI when booting the machine
  #   vb.gui = true
  #
  #   # Customize the amount of memory on the VM:
  #   vb.memory = "1024"
  # end
  #
  # View the documentation for the provider you are using for more
  # information on available options.

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  # config.vm.provision "shell", inline: <<-SHELL
  #   apt-get update
  #   apt-get install -y apache2
  # SHELL
end
