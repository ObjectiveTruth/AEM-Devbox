# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
    # Using Fedora for the base image
    config.vm.box = "fedora/23-cloud-base"
    config.vm.box_check_update = false

    config.vm.define "ObjTruthAEM" do |objtruthaem|
    end

    config.vm.provider "virtualbox" do |vb|
        # AEM recomments at least 1920 mb to work properly
        vb.memory = "3072"
        vb.cpus = 2
    end
    
    # Disable default rsync folder and setup new one
    config.vm.synced_folder ".", "/vagrant", disabled: true
    config.vm.synced_folder "./aem_install_files", "/home/vagrant/aem_install_files", disabled: false, type: "rsync", create: true

    # Creates host-only static ip address on the machine's private network
    config.vm.network "private_network", ip: "192.168.99.43"

    # Ports for AdobeEM 
    # Uncomment below if you want to access via localhost:xxxx
    # where xxxx is the port listed below.
    #config.vm.network "forwarded_port", guest: 4502, host: 4502
    #config.vm.network "forwarded_port", guest: 45335, host: 45335

    # Required to use ansible with dnf installer
    config.vm.provision "shell", inline: "dnf install python-dnf -y"
    config.vm.provision "shell", inline: "dnf install libselinux-python -y"

    # Run ansible playbook
    config.vm.provision "ansible" do |ansible|
        ansible.verbose = "v"
        ansible.playbook = "playbook.yml"
    end
end
