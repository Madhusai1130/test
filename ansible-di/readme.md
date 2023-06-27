------------------------ansible-dynamic-inventory--------------------

* This folder contains ansible scripts that installs docker on ec2 nodes only with tags(Ansible) using dynamic inventory.
* Before executing the scripts make sure the instances are provisioned in AWS and its keys as well.
* To execute the scripts. Type

        ansible-playbook playbook.yml

* hosts is default set in cfg file and other configs as well.