#!/bin/bash
apt-get update
apt-get -y install python-pip git
pip install ansible
cd /opt
git clone https://github.com/bertux/bitcoin-node
cd bitcoin-node/ansible
ansible-playbook bitcoin_node.yml >> /var/log/ansible-pull.log
