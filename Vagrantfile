# -*- mode: ruby -*-
# vi: set ft=ruby :


Vagrant.configure("2") do |config|
  config.vm.define "k3s-master" do |m|
  	m.vm.box = "ubuntu/focal64"
        m.vm.hostname = "k3s-master.localhost"
        m.vm.network "private_network", ip: "192.168.34.10"
        m.vm.provision "docker"
	m.disksize.size = '20GB'
  	m.vm.provider :virtualbox do |vb|
		vb.customize [ 'modifyvm', :id, '--memory', '1024' ]
		vb.customize [ 'modifyvm', :id, '--cpus', '1' ]
		vb.customize [ 'modifyvm', :id, '--name', 'k3s-master' ]
		vb.customize [ 'modifyvm', :id, '--nested-hw-virt', 'on' ]
		vb.customize [ 'modifyvm', :id, '--cpuexecutioncap', '100' ]
  	end
  end
  config.vm.define "k3s-worker1" do |m|
  	m.vm.box = "ubuntu/focal64"
        m.vm.hostname = "k3s-worker1.localhost"
        m.vm.network "private_network", ip: "192.168.34.11"
        m.vm.provision "docker"
	m.disksize.size = '20GB'
  	m.vm.provider :virtualbox do |vb|
		vb.customize [ 'modifyvm', :id, '--memory', '1024' ]
		vb.customize [ 'modifyvm', :id, '--cpus', '1' ]
		vb.customize [ 'modifyvm', :id, '--name', 'k3s-worker1' ]
		vb.customize [ 'modifyvm', :id, '--nested-hw-virt', 'on' ]
		vb.customize [ 'modifyvm', :id, '--cpuexecutioncap', '100' ]
  	end
  end
  config.vm.define "k3s-worker2" do |m|
  	m.vm.box = "ubuntu/focal64"
        m.vm.hostname = "k3s-worker2.localhost"
        m.vm.network "private_network", ip: "192.168.34.12"
        m.vm.provision "docker"
	m.disksize.size = '20GB'
  	m.vm.provider :virtualbox do |vb|
		vb.customize [ 'modifyvm', :id, '--memory', '1024' ]
		vb.customize [ 'modifyvm', :id, '--cpus', '1' ]
		vb.customize [ 'modifyvm', :id, '--name', 'k3s-worker2' ]
		vb.customize [ 'modifyvm', :id, '--nested-hw-virt', 'on' ]
		vb.customize [ 'modifyvm', :id, '--cpuexecutioncap', '100' ]
  	end
  end
end
