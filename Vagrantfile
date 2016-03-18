# -*- mode: ruby -*-
# vi: set ft=ruby :
# rubocop:disable Style/GlobalVars
# All Vagrant configuration is done below. The '2' in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.

$script = <<SCRIPT
echo Provisioning stuff
date > /etc/vagrant_provisioned_at
apt-add-repository -y ppa:brightbox/ruby-ng
apt-get -y update
apt-get -y install gpgv2 git runit monit g++ libreadline6-dev zlib1g-dev libssl-dev libyaml-dev libsqlite3-dev sqlite3 autoconf libgdbm-dev libncurses5-dev automake libtool bison pkg-config libffi-dev libgmp-dev ruby2.3 ruby2.3-dev
rm -rf ~/.gnupg/
useradd -d /home/deploy -G sudo -p $(openssl passwd -1 deploy) -s /bin/bash -m deploy
mkdir -p /var/www
chown deploy:www-data /var/www
mkdir -p /etc/monit/conf.d
chown -R deploy:root /etc/monit/conf.d
chmod 6775 /etc/monit/conf.d
chmod 0700 /etc/monit
mkdir -p /var/run/monit
chmod 0755 /var/run/monit
mkdir -p /etc/service
chown -R deploy:root /etc/service
chmod 6755 /etc/service
mkdir -p /etc/sv/deploy
chown -R deploy:root /etc/sv
chmod -R 6755 /etc/sv
mkdir -p /var/log/service
chown -R deploy:syslog /var/log/service
chmod 6755 /var/log/service
SCRIPT

$nginx_script_lines = <<SCRIPT
mkdir -p /var/log/nginx
chmod 6775 -R /var/log/nginx
chown -R deploy:root /var/log/nginx
SCRIPT

$beforefileuploadperms = <<SCRIPT
chmod 0777 /etc/monit
rm /etc/monit/monitrc
touch /etc/sudoers.d/monit_runit_app
echo 'deploy ALL=NOPASSWD: /usr/bin/monit *' >> /etc/sudoers.d/monit_runit_app
echo 'deploy ALL=NOPASSWD: /usr/sbin/service monit *' >> /etc/sudoers.d/monit_runit_app
echo 'deploy ALL=NOPASSWD: /usr/bin/sv *' >> /etc/sudoers.d/monit_runit_app
echo 'deploy ALL=NOPASSWD: /usr/sbin/service nginx *' >> /etc/sudoers.d/monit_runit_app
SCRIPT

$afterfileuploadperms = <<SCRIPT
chmod 0700 /etc/monit
SCRIPT

Vagrant.configure(2) do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://atlas.hashicorp.com/search.
  config.vm.box = 'ubuntu/trusty64'

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing 'localhost:8080' will access port 80 on the guest machine.
  # config.vm.network 'forwarded_port', guest: 80, host: 8080

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  config.vm.network 'private_network', ip: '10.30.20.20'

  config.vm.provision 'shell', inline: $script
  config.vm.provision 'shell', inline: $beforefileuploadperms
  config.vm.provision :file do |f|
    f.source = './vagrant/monitrc'
    f.destination = '/etc/monit/monitrc'
  end
  config.vm.provision 'shell', inline: $afterfileuploadperms
  # config.ssh.username 'deploy'
  # config.ssh.password 'deploy'

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network 'public_network'

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder '../data', '/vagrant_data'

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  # config.vm.provider 'virtualbox' do |vb|
  #   # Display the VirtualBox GUI when booting the machine
  #   vb.gui = true
  #
  #   # Customize the amount of memory on the VM:
  #   vb.memory = '1024'
  # end
  #
  # View the documentation for the provider you are using for more
  # information on available options.

  # Define a Vagrant Push strategy for pushing to Atlas. Other push strategies
  # such as FTP and Heroku are also available. See the documentation at
  # https://docs.vagrantup.com/v2/push/atlas.html for more information.
  # config.push.define 'atlas' do |push|
  #   push.app = 'YOUR_ATLAS_USERNAME/YOUR_APPLICATION_NAME'
  # end

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  # config.vm.provision 'shell', inline: <<-SHELL
  #   sudo apt-get update
  #   sudo apt-get install -y apache2
  # SHELL
  #
  config.vm.provider 'virtualbox' do |v|
    v.name = 'capistrano_test'
    v.cpus = 4 # Speed up ruby compilation
    v.memory = 2048 # Speed up ruby compilation
    v.customize [
      'modifyvm', :id,
      '--groups', '/Vagrant'
    ]
  end
end
