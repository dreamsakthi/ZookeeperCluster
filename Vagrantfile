# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.box = "puppetlabs/centos-6.6-64-puppet"
  config.ssh.forward_agent = true # So that boxes don't have to setup key-less ssh
  config.ssh.insert_key = false # To generate a new ssh key and don't use the default Vagrant one
 
  # common provisioning for all 
  config.vm.provision "shell", path: "scripts/init.sh"
  
  # configure zookeeper cluster
  (1..3).each do |i|
    config.vm.define "zookeeper#{i}" do |s|
      s.vm.hostname = "zookeeper#{i}"
      s.vm.network "private_network", ip: "192.168.33.#{i+1}"
      s.vm.provision "shell", path: "scripts/zookeeper.sh", args:"#{i}", privileged: false
	  s.vm.network :forwarded_port, guest: 2181, host: 2181, auto_correct: true
	  s.vm.network :forwarded_port, guest: 9092, host: 9092, auto_correct: true
	
    end
  end

  # configure brokers
  (1..3).each do |i|
    config.vm.define "broker#{i}" do |s|
      s.vm.hostname = "broker#{i}"
      s.vm.network "private_network", ip: "192.168.33.#{4-i}0"
      s.vm.provision "shell", path: "scripts/broker.sh", args:"#{i}", privileged: false
	  s.vm.network :forwarded_port, guest: 2181, host: 2181, auto_correct: true
	  s.vm.network :forwarded_port, guest: 9092, host: 9092, auto_correct: true
    end
  end

  config.vm.provider "virtualbox" do |v|
    #  This setting controls how much cpu time a virtual CPU can use. A value of 50 implies a single virtual CPU can use up to 50% of a single host CPU.
    v.customize ["modifyvm", :id, "--cpuexecutioncap", "50"]
  end
end
