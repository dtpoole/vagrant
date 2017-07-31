Vagrant.configure("2") do |config|

  config.vm.box = "ubuntu/xenial64"
  
  #config.disksize.size = "25GB"
  #config.vm.synced_folder "data", "/data"

  config.vm.provider "virtualbox" do |vb|
    vb.cpus = "4"
    vb.memory = "8192"
    vb.gui = false
  end

  config.vbguest.iso_path = "http://download.virtualbox.org/virtualbox/$VBOX_VERSION/VBoxGuestAdditions_$VBOX_VERSION.iso"
  
  #config.vm.network "forwarded_port", guest: 8888, host: 8888, host_ip: "127.0.0.1"

  config.ssh.forward_agent = true
  config.vm.hostname = 'vagrant'

  config.vm.provision "shell", path: "provision.sh"
end
