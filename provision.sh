#!/usr/bin/env bash

sudo yum update -y
sudo yum install -y epel-release
sudo yum install -y wget lynx mailx git unzip nano vim redis ImageMagick clamav clamav-update clamav-devel mysql-devel java-1.8.0-openjdk-devel nodejs gcc bzip2 kernel-devel dkms libevent-devel libxslt-devel libxml2-devel ghostscript openoffice ntp

# Install ffmpeg
sudo rpm --import http://li.nux.ro/download/nux/RPM-GPG-KEY-nux.ro
sudo rpm -Uvh http://li.nux.ro/download/nux/dextop/el7/x86_64/nux-dextop-release-0-1.el7.nux.noarch.rpm
sudo yum -y install ffmpeg ffmpeg-devel

# Get clamav working
sudo sed -i '/^Example/d' /etc/freshclam.conf
sudo /usr/bin/freshclam

# Install tmux
su - vagrant -c 'cd /home/vagrant && wget https://github.com/tmux/tmux/releases/download/2.2/tmux-2.2.tar.gz'
su - vagrant -c 'cd /home/vagrant && tar -xzf tmux-2.2.tar.gz'
su - vagrant -c 'cd /home/vagrant/tmux-2.2 && ./configure && make'
cd /home/vagrant/tmux-2.2 && sudo make install

# Install RVM
su - vagrant -c 'gpg2 --keyserver hkp://pool.sks-keyservers.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB'
su - vagrant -c 'curl -L https://get.rvm.io | bash -s stable --ruby'
su - vagrant -c 'rvm 2.5.3 --install --default'

# install bundler
su - vagrant -c 'gem install bundler'

# Install Fits
su - vagrant -c 'cd /home/vagrant && wget http://projects.iq.harvard.edu/files/fits/files/fits-1.0.5.zip'
su - vagrant -c 'cd /home/vagrant && unzip fits-1.0.5.zip'
su - vagrant -c 'chmod u+x /home/vagrant/fits-1.0.5/fits.sh'

# Install Redis
su - vagrant -c 'cd /home/vagrant && wget http://download.redis.io/releases/redis-4.0.3.tar.gz'
su - vagrant -c 'cd /home/vagrant && tar xzvf redis-4.0.3.tar.gz'
su - vagrant -c 'cd /home/vagrant/redis-4.0.3 && make'
cd /home/vagrant/redis-4.0.3 && sudo make install
