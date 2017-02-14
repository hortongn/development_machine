1. Install Vagrant and VirtualBox on your local host.

1. Clone this repository: `git clone https://github.com/hortongn/development_machine.git`

1. `cd development_machine`

1. Edit the Vagrantfile to customize your settings
   * Change `config.vm.hostname` to a different host name if you don't like the default
   * Add more `config.vm.network "forwarded_port"` lines if you need more ports available
   * Change `config.vm.synced_folder` (the `~/Development` part) to use the folder on your Mac that contains your development code
      * Note: you probably need to follow these NFS instructions too on your host machine: https://www.vagrantup.com/docs/synced-folders/nfs.html#root-privilege-requirement
   * Change `vb.memory` to the amount of RAM you want to giv the VM (default is 4 GB)

1. `vagrant up`

1. `vagrant ssh`

