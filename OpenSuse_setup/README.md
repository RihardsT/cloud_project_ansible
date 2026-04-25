### Setup
```
sudo zypper install ansible

cd ~/Code/cloud_project/cloud_project_ansible/OpenSuse_setup/
sudo echo
ansible-playbook ./laptop.yaml --diff
# Use --ask-become-pass/-K, as the sudo echo thing stopped working
ansible-playbook ./laptop.yaml --diff --ask-become-pass

sudo echo
ansible-playbook ./stac.yaml --diff
```
