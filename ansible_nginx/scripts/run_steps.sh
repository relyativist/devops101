#!/bin/bash
#https://www.dmosk.ru/instruktions.php?object=ansible-nginx-install
#On ansible side:
ssh-keygen
#copy
cat .ssh/id_rsa.pub

#On webserver side:
echo 'id_rsa.pub' > /root/.ssh/authorized keys

#Check icmp connection on ansible side
ansible -m ping all -u vagrant -i hosts

#copy ansible set up
mkdir -p /etc/vagrant/nginx && cp -r /vagrant/roles /etc/ansible/nginx

#run playbook:
ansible-playbook play.yml -e 'ansible_python_interpreter=/usr/bin/python3' -i hosts
