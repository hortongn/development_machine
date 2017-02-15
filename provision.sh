#!/usr/bin/env bash

sudo yum update -y
sudo yum install -y epel-release
sudo yum install -y lynx mailx git unzip nano vim redis ImageMagick clamav clamav-update clamav-devel mysql-devel java-1.8.0-openjdk-devel nodejs gcc bzip2 kernel-devel dkms libevent-devel libxslt-devel libxml2-devel

# Get clamav working
sudo sed -i '/^Example/d' /etc/freshclam.conf
sudo /usr/bin/freshclam

# Install tmux
su - vagrant -c 'cd /home/vagrant && wget https://github.com/tmux/tmux/releases/download/2.2/tmux-2.2.tar.gz'
su - vagrant -c 'cd /home/vagrant && tar -xzf tmux-2.2.tar.gz'
su - vagrant -c 'cd /home/vagrant/tmux-2.2 && ./configure && make'
cd /home/vagrant/tmux-2.2 && sudo make install

# Install RVM
su - vagrant -c 'gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3'
su - vagrant -c 'curl -L https://get.rvm.io | bash -s stable --ruby'
su - vagrant -c 'rvm 2.3.3 --install --default'

# install bundler
su - vagrant -c 'gem install bundler'

# Install Fits
su - vagrant -c 'cd /home/vagrant && wget http://projects.iq.harvard.edu/files/fits/files/fits-0.8.5.zip'
su - vagrant -c 'cd /home/vagrant && unzip fits-0.8.5.zip'
su - vagrant -c 'chmod u+x /home/vagrant/fits-0.8.5/fits.sh'

# Install phantomjs
su - vagrant -c 'cd /home/vagrant && wget https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-2.1.1-linux-x86_64.tar.bz2'
su - vagrant -c 'cd /home/vagrant && tar -xvf phantomjs-2.1.1-linux-x86_64.tar.bz2'
cd /home/vagrant/phantomjs-2.1.1-linux-x86_64/bin && sudo cp phantomjs /usr/bin

# Install Redis
su - vagrant -c 'cd /home/vagrant && wget http://download.redis.io/releases/redis-2.8.3.tar.gz'
su - vagrant -c 'cd /home/vagrant && tar xzvf redis-2.8.3.tar.gz'
su - vagrant -c 'cd /home/vagrant/redis-2.8.3 && make'
cd /home/vagrant/redis-2.8.3 && sudo make install
