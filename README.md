## RudensPavasaris cloud project Ansible playbook
### Run
```
docker run -ti --rm -v ~/Code/CloudProject/cloud_project_ansible:/d -v ~/Code/CloudProject/Secrets/:/Secrets/ -v ~/.ssh/:/root/.ssh -w /d williamyeh/ansible:alpine3-onbuild sh -c 'apk add --no-cache openssh-client && \
eval "$(ssh-agent -s)"; ssh-add /root/.ssh/scaleway && \
ansible-playbook -i ./Inventory --limit production --vault-password-file ../Secrets/ansible_vault_pass -u rihards --diff Playbook.yml'
```
Backend:
```
docker run -ti --rm -v ~/Code/CloudProject/cloud_project_ansible:/d -v ~/Code/CloudProject/Secrets/:/Secrets/ -v ~/.ssh/:/root/.ssh -w /d williamyeh/ansible:alpine3-onbuild sh -c 'apk add --no-cache openssh-client && \
eval "$(ssh-agent -s)"; ssh-add /root/.ssh/scaleway && \
ansible-playbook -i ./Inventory --limit backend --vault-password-file ../Secrets/ansible_vault_pass -u rihards --diff Playbook.yml'
```
Scaleway first run
```
docker run -ti --rm -v ~/Code/CloudProject/cloud_project_ansible:/d -v ~/Code/CloudProject/Secrets/:/Secrets/ -v ~/.ssh/:/root/.ssh -w /d williamyeh/ansible:alpine3-onbuild sh -c 'apk add --no-cache openssh-client && \
eval "$(ssh-agent -s)"; ssh-add /root/.ssh/scaleway && \
ansible-playbook -i ./Inventory --limit production --vault-password-file ../Secrets/ansible_vault_pass -u root --diff Playbook.yml -e ansible_port=22'
```
Backend first run:
```
docker run -ti --rm -v ~/Code/CloudProject/cloud_project_ansible:/d -v ~/Code/CloudProject/Secrets/:/Secrets/ -v ~/.ssh/:/root/.ssh -w /d williamyeh/ansible:alpine3-onbuild sh -c 'apk add --no-cache openssh-client && \
eval "$(ssh-agent -s)"; ssh-add /root/.ssh/scaleway && \
ansible-playbook -i ./Inventory --limit backend --vault-password-file ../Secrets/ansible_vault_pass -u root --diff Playbook.yml -e ansible_port=22'
```

### Set up
Get required roles, before running anything.
```
# Install required roles
ansible-galaxy install --roles-path ./roles -r requirements.yml
# Force role update required roles
ansible-galaxy install --roles-path ./roles -r requirements.yml --force

docker run -ti --rm -v ~/Code/CloudProject/cloud_project_ansible:/d -w /d williamyeh/ansible:alpine3-onbuild sh -c 'ansible-galaxy install --roles-path ./roles -r requirements.yml --force'

```
Because ansible and molecule work better with python2, I was using pyenv. Now I don't care and use docker.
```
pyenv local 2.7.13
pip2 install -U packaging;
pip2 install -U ansible
```



### Other or old stuff
Further runs are done now with Ansible vault:
```
ansible-playbook -i ./Inventory --limit production -u rihards --diff Playbook.yml --ask-vault-pass
ansible-playbook -i ./Inventory --limit production -u rihards --diff Playbook.yml --vault-password-file ../Secrets/ansible_vault_pass
```

Alternate run commands:
```
docker run -ti --rm -v ~/Code/CloudProject/cloud_project_ansible:/d -v ~/Code/CloudProject/Secrets/:/Secrets/ -v ~/.ssh/:/root/.ssh -w /d williamyeh/ansible:alpine3-onbuild sh -c 'apk add --no-cache openssh-client && \
eval "$(ssh-agent -s)"; ssh-add /root/.ssh/raspberrypi && \
ansible-playbook -i ./Inventory --limit raspberry --vault-password-file ../Secrets/ansible_vault_pass -u rihards --diff Raspberry.yml'


ansible-playbook -i ./Inventory -u ubuntu --limit aws --diff Playbook.yml
```
AWS playbook runs. For first run use ubuntu user
```
docker run -ti --rm -v ~/Code/CloudProject/cloud_project_ansible:/d -v ~/Code/CloudProject/Secrets/:/Secrets/ -v ~/.ssh/:/root/.ssh -w /d williamyeh/ansible:alpine3-onbuild sh -c 'apk add --no-cache openssh-client && \
eval "$(ssh-agent -s)"; ssh-add /root/.ssh/aws && \
ANSIBLE_HOST_KEY_CHECKING=False && \
ansible-playbook -i ./Inventory --limit aws -u ubuntu --diff aws.yml --vault-password-file ../Secrets/ansible_vault_pass'
```

AWS playbook runs. After the first one.
```
docker run -ti --rm -v ~/Code/CloudProject/cloud_project_ansible:/d -v ~/Code/CloudProject/Secrets/:/Secrets/ -v ~/.ssh/:/root/.ssh -w /d williamyeh/ansible:alpine3-onbuild sh -c 'apk add --no-cache openssh-client && \
eval "$(ssh-agent -s)"; ssh-add /root/.ssh/scaleway && \
ansible-playbook -i ./Inventory --limit aws -u rihards --diff aws.yml --vault-password-file ../Secrets/ansible_vault_pass'
```

Try to get it working within terraform:
```
docker run -i --rm -v ~/Code/CloudProject/cloud_project_ansible:/d -v ~/Code/CloudProject/Secrets/:/Secrets/ -v ~/.ssh/:/root/.ssh -w /d williamyeh/ansible:alpine3-onbuild sh -c 'apk add --no-cache openssh-client && eval $(ssh-agent -s) && ssh-add /root/.ssh/aws && export ANSIBLE_HOST_KEY_CHECKING=False && ansible-playbook -e ansible_python_interpreter=/usr/bin/python3 -i ${aws_instance.web.public_ip}, -u ubuntu --diff --vault-password-file ../Secrets/ansible_vault_pass aws.yml'
```

### Ansible vault
```
ansible-vault create vars/vault.yml
ansible-vault edit vars/vault.yml --vault-password-file ../Secrets/ansible_vault_pass
```





### Molecule with docker:
```
docker run -ti --rm -v ~/Code/CloudProject/cloud_project_ansible:/d -v ~/Code/CloudProject/Secrets/:/Secrets/ -v ~/.ssh/:/root/.ssh -v /var/run/docker.sock:/var/run/docker.sock williamyeh/ansible:alpine3-onbuild sh -c '
apk add --no-cache docker && \
pip install molecule==1.25.0 docker && \
cd /d && \
molecule list && \
molecule create && \
molecule converge'
```



### To do:
- [ ] MR for security role to reload sshd on after change
- [x] Set up Gitlab runner
  - [ ] Pull request to https://github.com/DBLaci/ansible-gitlab-runner for ubuntu 17.04 support
  - [ ] Ensure /var/lib/gitlab-runner is created otherwise runner service doesn't start
  - [x] Lookup the token from safer place and push the vars to repo then https://docs.ansible.com/ansible/latest/playbooks_lookups.html
- [ ] Set up Vault
