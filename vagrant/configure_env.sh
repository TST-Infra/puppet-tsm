#!/bin/bash

# configuração básica do ambiente
echo "Ambiente de DEV do Puppet Module TSM Client" > /etc/motd
ln -s /vagrant /etc/puppetlabs/code/modules/tsm

# configura o proxy
PROXY_SERVER="http://proxyserver.rede.tst:3128"
echo "https_proxy=\"${PROXY_SERVER}\"" > /etc/profile.d/proxy.sh
echo "http_proxy=\"${PROXY_SERVER}\"" >> /etc/profile.d/proxy.sh
echo "export https_proxy http_proxy" >> /etc/profile.d/proxy.sh
source /etc/profile.d/proxy.sh

# configura o hiera
mkdir -p /etc/puppetlabs/puppet/data/nodes
rm -f /etc/puppetlabs/puppet/hiera.yaml
ln -s /vagrant/hiera/hiera.yaml /etc/puppetlabs/puppet/
ln -s /vagrant/hiera/common.yaml /etc/puppetlabs/puppet/data/
ln -s /vagrant/hiera/node.yaml /etc/puppetlabs/puppet/data/nodes/$(hostname).yaml

# disponibiliza o yum repo do TSM
cat <<YUM > /etc/yum.repos.d/tsm-client.repo
[tsm-client]
baseurl = http://vm768.rede.tst/pulp/repos/TST/Library/custom/TSM_Client/tsm-client-8-x86_64/
name = tsm-client
enabled = 1
gpgcheck = 0
YUM
