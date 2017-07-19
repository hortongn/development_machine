1. Install Vagrant and VirtualBox on your local host.
   * Note: Vagrant 1.8.x seems to be best.  Later versions seem to have problems with the NFS mounting.

1. Clone this repository: `git clone https://github.com/hortongn/development_machine.git`

1. `cd development_machine`

1. `vagrant plugin install vagrant-vbguest`

1. Edit the Vagrantfile to customize your settings
   * Change `config.vm.hostname` to a different host name if you don't like the default
   * Add more `config.vm.network "forwarded_port"` lines if you need more ports available
   * Change `config.vm.synced_folder` (the `~/Development` part) to use the directory on your Mac that contains your development code
      * Note: you probably need to follow these NFS instructions too on your host machine: https://www.vagrantup.com/docs/synced-folders/nfs.html#root-privilege-requirement
   * Change `vb.memory` to the amount of RAM you want to giv the VM (default is 4 GB)

1. `vagrant up --no-provision` (This boots the virtual machine.  On first run it creates the machine)
   * If you see errors about not being able to mount a folder, ignore that and move on to next step.

1. `vagrant provision` (This runs the provision.sh script)

1. `vagrant reload`

1. `vagrant ssh` (This logs you in to the virtual machine command prompt)

Once you are logged into the virtual machine you should see a `Development` directory that contains the development code that resides on your host machine.  You will be logged in as user `vagrant` with password `vagrant`.  You can sudo to make root changes.

When you want to shut down the virtual machine, cd to the development_machine directory on your host and `vagrant halt`

If you ever want to fully delete the virtual machine, cd to the development_machine directory on your host and `vagrant destroy`
