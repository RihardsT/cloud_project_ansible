### Pre requisistes
```
sudo apt update
sudo apt install -y python3-pip
python3 -m pip install -U --user ansible
```

### Run
```
# sudo something first, to make sure ansible can become root
sudo echo
PATH="$PATH:`python3 -m site --user-base`/bin"
cd ~/Code/cloud_project_ansible/
ansible-playbook LinuxMint_setup/stac.yml --diff

cd ~/Code/cloud_project/cloud_project_ansible/
ansible-playbook LinuxMint_setup/laptop.yml --diff

ansible-playbook ~/Code/cloud_project/cloud_project_ansible/LinuxMint_setup/aliases_only.yaml
```


### Notes
Applet `Places Center` downloaded, but not added to taskbar.
Had to add it manually for it to show up. Eh

gsettings list-recursively > /home/rihards/gsettings_before_ansible
gsettings list-recursively > /home/rihards/gsettings_after_ansible; diff gsettings_before_ansible gsettings_after_ansible

https://stackoverflow.com/questions/36627258/how-can-i-find-out-the-default-applications-on-linux-centos-ubuntu-using-the
https://superuser.com/questions/1006983/how-to-set-cinnamon-preferences-in-command-line

### To Do
Firefox about:config
browser.sessionstore.restore_on_demand
browser.sessionstore.restore_pinned_tabs_on_demand true

https://askubuntu.com/questions/313483/how-do-i-change-firefoxs-aboutconfig-from-a-shell-script
put it in .mozilla/firefox/lgc3asai.default-release/user.js
take inspiration from .mozilla/firefox/lgc3asai.default-release/prefs.js


### LMDE
```
# Change the apt mirror first
sudo software-sources
sudo apt update && sudo apt install -y ansible

#
sudo apt update && sudo apt install -y python3.11-venv # python3-pip ansible-core
python3 -m venv venv-ansible
$(pwd)/venv-ansible/bin/pip3 install ansible
PATH="$PATH:$(pwd)/venv-ansible/bin/"
`
