# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "squeeze64"

  # Customize memory
  #config.vm.customize ["modifyvm", :id, "--memory", "256"]

  config.vm.provision :puppet do |puppet|
    puppet.pp_path = "/vagrant"
    puppet.manifests_path = "manifests"
    puppet.module_path = "../"
    puppet.manifest_file = "site.pp"
    puppet.options = "--verbose"
  end

  # smtp01
  config.vm.define :smtp01 do |smtp01_config|
    smtp01_config.vm.host_name = "smtp02"
    smtp01_config.vm.network :hostonly, "192.168.33.10"
    smtp01_config.vm.forward_port 25, 2525
  end
  
  # smtp02
  config.vm.define :smtp02 do |smtp02_config|
    smtp02_config.vm.host_name = "smtp02"
    smtp02_config.vm.network :hostonly, "192.168.33.20"
    smtp02_config.vm.forward_port 25, 2626
  end
end