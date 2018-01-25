#!/bin/sh
#
# Installation du depot Epel, git et svn
#
yum install -y \
    git \
    epel-release \
    subversion

#
# Installation d'Ansible provenant du depot Epel, ajout de localhost
# a l'inventaire par defaut
#
yum install -y ansible
if [ $(egrep -s "^localhost" /etc/ansible/hosts | wc -l ) -eq 0 ]; then
  echo "localhost" >> /etc/ansible/hosts
fi

#
# Installation Docker et Jenkins
#
curl -o /tmp/idc.yml https://raw.githubusercontent.com/Inspq/pub/master/playbooks/idc/idc.yml
ansible-playbook -c local /tmp/idc.yml
rm /tmp/idc.yml

