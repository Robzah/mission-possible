Vagrant.configure("2") do |config|
	config.vm.box = "ubuntu/xenial64"
	config.vm.hostname = "tomcat"		
	config.vm.network "private_network", ip: "192.168.0.40"
	config.vm.synced_folder ".", "/vagrant"
    config.vm.provision "shell" do |s|
	s.path = "linuxProvisioning.sh"
    end
end
