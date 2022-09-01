### Pre requisistes
```
sudo apt update
sudo apt install -y python3-pip
python3 -m pip install -U --user ansible
```

### Run
```
# sudo something first, to make sure ansible can become root
PATH="$PATH:`python3 -m site --user-base`/bin"
cd ~/Code/cloud_project_ansible/
ansible-playbook LinuxMint_setup/stac.yml
```


### Notes
Add applet `Places Center` manually.
Don't care yet to search how to add it automatically.
In future check:  
https://forums.linuxmint.com/viewtopic.php?t=376881
