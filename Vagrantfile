Vagrant.configure(2) do |config|

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://atlas.hashicorp.com/search.
  config.vm.box = "ubuntu/trusty64"
  #config.vm.network "private_network", type: "dhcp"
  # config.vm.hostname = "chef-client"
  config.vm.network "private_network", ip: "172.28.128.3"

  config.vm.provision :shell, path: "bootstrap.sh"

  config.vm.network :forwarded_port, guest: 80, host: 8002
  config.vm.network :forwarded_port, guest: 8889, host: 8889
end
