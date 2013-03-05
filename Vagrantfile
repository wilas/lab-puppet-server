# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|
  
  config.vm.define :shepherd do |node_config|  
    vm_name= "shepherd"
    node_config.vm.box = "SL6"
    node_config.vm.host_name = "#{vm_name}.farm"
    node_config.vm.customize ["modifyvm", :id, "--memory", "1024", "--name", "#{vm_name}"]
  
    node_config.vm.network :hostonly, "77.77.77.10"
    node_config.vm.share_folder "v-root", "/vagrant", "."

    node_config.vm.provision :puppet do |puppet|
        puppet.options = "--hiera_config hiera.yaml"
        puppet.manifests_path = "manifests"
        puppet.manifest_file  = "master.pp"
        puppet.module_path = "modules"
    end
  end
  config.vm.define :sheep_app1 do |node_config|  
    vm_name= "sheep_app1"
    node_config.vm.box = "SL6"
    node_config.vm.host_name = "#{vm_name}.farm"
    node_config.vm.customize ["modifyvm", :id, "--memory", "512", "--name", "#{vm_name}"]
  
    node_config.vm.network :hostonly, "77.77.77.101"
    node_config.vm.share_folder "v-root", "/vagrant", "."

    # puppet must be installed - shell script or kickstart
    # DNS server or update /etc/hosts
    node_config.vm.provision :puppet do |puppet|
        puppet.manifests_path = "manifests"
        puppet.manifest_file  = "dirty_dns.pp"
    end
    # You can also use aready created puppet server for provisioning
    # First start puppet master on shepherd: puppet master --verbose --no-daemonize
    node_config.vm.provision :puppet_server do |puppet|
        puppet.puppet_server = "shepherd.farm"
        puppet.puppet_node = "#{vm_name}.farm"
        puppet.options = ["--onetime",
            "--verbose",
            "--waitforcert=20",
            "--no-usecacheonfailure",
            "--no-daemonize",
            "--verbose",
            "--debug"]
    end
  end
  config.vm.define :sheep_app2 do |node_config|  
    vm_name= "sheep_app2"
    node_config.vm.box = "SL6"
    node_config.vm.host_name = "#{vm_name}.farm"
    node_config.vm.customize ["modifyvm", :id, "--memory", "512", "--name", "#{vm_name}"]
  
    node_config.vm.network :hostonly, "77.77.77.102"
    node_config.vm.share_folder "v-root", "/vagrant", "."

    # puppet must be installed - shell script or kickstart
    # DNS server or update /etc/hosts
    node_config.vm.provision :puppet do |puppet|
        puppet.manifests_path = "manifests"
        puppet.manifest_file  = "dirty_dns.pp"
    end 
    # You can also use aready created puppet server for provisioning
    # First start puppet master on shepherd: puppet master --verbose --no-daemonize
    node_config.vm.provision :puppet_server do |puppet|
        puppet.puppet_server = "shepherd.farm"
        puppet.puppet_node = "#{vm_name}.farm"
        puppet.options = ["--onetime",
            "--verbose",
            "--waitforcert=20",
            "--no-usecacheonfailure",
            "--no-daemonize",
            "--verbose",
            "--debug"]
    end
  end
end
