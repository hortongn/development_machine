#!/usr/bin/env bash

sudo yum update -y
sudo yum install -y epel-release
sudo yum install -y git unzip tmux nano vim redis ImageMagick clamav clamav-update clamav-devel mysql-devel java-1.8.0-openjdk-devel nodejs gcc bzip2 kernel-devel dkms

# Get clamav working
sudo sed -i '/^Example/d' /etc/freshclam.conf
sudo /usr/bin/freshclam

# Install RVM
su - vagrant -c 'gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3'
su - vagrant -c 'curl -L https://get.rvm.io | bash -s stable --ruby'
su - vagrant -c 'rvm 2.1.6 --install --default'

# install bundler
su - vagrant -c 'gem install bundler'

# Characterization
su - vagrant -c 'cd /home/vagrant && wget http://projects.iq.harvard.edu/files/fits/files/fits-0.6.2.zip'
su - vagrant -c 'cd /home/vagrant && unzip fits-0.6.2.zip'
su - vagrant -c 'chmod u+x /home/vagrant/fits-0.6.2/fits.sh'

