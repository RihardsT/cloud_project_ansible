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

ansible-playbook LinuxMint_setup/laptop.yml --diff
```


### Notes
Applet `Places Center` downloaded, but not added to taskbar.
Had to add it manually for it to show up. Eh

gsettings list-recursively > /home/rihards/gsettings_before_ansible
gsettings list-recursively > /home/rihards/gsettings_after_ansible; diff gsettings_before_ansible gsettings_after_ansible

https://stackoverflow.com/questions/36627258/how-can-i-find-out-the-default-applications-on-linux-centos-ubuntu-using-the
https://superuser.com/questions/1006983/how-to-set-cinnamon-preferences-in-command-line
