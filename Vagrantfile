# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|
  
  #gem install vagrant-vbguest
  #config.vbguest.auto_update = false
  #config.vbguest.iso_path = "#{ENV['HOME']}/Downloads/VBoxGuestAdditions.iso"
  #config.vbguest.iso_path = "http://company.server/VirtualBox/$VBOX_VERSION/VBoxGuestAdditions.iso"

  config.vm.define :shepherd do |sh_config|  
    vm_name= "shepherd"
    sh_config.vm.box = "SL64_box"
    sh_config.vm.host_name = "#{vm_name}.farm"
    sh_config.vm.customize ["modifyvm", :id, "--memory", "1024", "--name", "#{vm_name}"]
  
    #sh_config.vm.network :bridged
    #sh_config.vm.network :bridged, :adapter => 1
    #sh_config.vm.network :bridged, { bridge: 'wlan0' }
    sh_config.vm.network :hostonly, "77.77.77.10"
    sh_config.vm.share_folder "v-root", "/vagrant", "."

    sh_config.vm.provision :puppet do |puppet|
        puppet.manifests_path = "manifests"
        puppet.manifest_file  = "master.pp"
        puppet.module_path = "modules"
        # puppet.options = ["--fileserverconfig=/vagrant/fileserver.conf", ]
    end
  end
  config.vm.define :sheep01 do |sh1_config|  
    vm_name= "sheep01"
    sh1_config.vm.box = "SL64_box"
    sh1_config.vm.host_name = "#{vm_name}.farm"
    sh1_config.vm.customize ["modifyvm", :id, "--memory", "512", "--name", "#{vm_name}"]
  
    sh1_config.vm.network :hostonly, "77.77.77.101"
    sh1_config.vm.share_folder "v-root", "/vagrant", "."

    sh1_config.vm.provision :puppet do |puppet|
        puppet.manifests_path = "manifests"
        puppet.manifest_file  = "agent.pp"
        puppet.module_path = "modules"
    end
  end
  config.vm.define :sheep02 do |sh2_config|  
    vm_name= "sheep02"
    sh2_config.vm.box = "SL64_box"
    sh2_config.vm.host_name = "#{vm_name}.farm"
    sh2_config.vm.customize ["modifyvm", :id, "--memory", "512", "--name", "#{vm_name}"]
  
    sh2_config.vm.network :hostonly, "77.77.77.102"
    sh2_config.vm.share_folder "v-root", "/vagrant", "."

    sh2_config.vm.provision :puppet do |puppet|
        puppet.manifests_path = "manifests"
        puppet.manifest_file  = "agent.pp"
        puppet.module_path = "modules"
    end
    
    #run puppet agent daemon.... before edit /etc/hosts (add puppet_server)
    sh2_config.vm.provision :puppet_server do |puppet|
        puppet.puppet_server = "shepherd.farm"
        puppet.puppet_node = "#{vm_name}.farm"
    end

  end
  config.vm.define :sheep03 do |sh3_config|  
    vm_name= "sheep03"
    sh3_config.vm.box = "SL64_box"
    sh3_config.vm.host_name = "#{vm_name}.farm"
    sh3_config.vm.customize ["modifyvm", :id, "--memory", "512", "--name", "#{vm_name}"]
  
    sh3_config.vm.network :hostonly, "77.77.77.103"
    sh3_config.vm.share_folder "v-root", "/vagrant", "."
    
    sh3_config.vm.provision :puppet do |puppet|
        puppet.manifests_path = "manifests"
        # set /etc/hosts
        puppet.manifest_file  = "simple.pp"
    end

    sh3_config.vm.provision :puppet_server do |puppet|
        puppet.puppet_server = "shepherd.farm"
        puppet.puppet_node = "#{vm_name}.farm"
    end

  end
end
