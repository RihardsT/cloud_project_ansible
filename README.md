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
ansible-playbook -i ./Inventory --limit backend -u root --diff Backend.yml -e ansible_port=22'
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

### Other or old stuff
Alternate run commands:
```
# Raspberry first:
docker run -ti --rm -v ~/Code/CloudProject/cloud_project_ansible:/d -v ~/Code/CloudProject/Secrets/:/Secrets/ -v ~/.ssh/:/root/.ssh -w /d williamyeh/ansible:alpine3-onbuild sh -c'
ansible-playbook -i ./Inventory --limit raspberry --vault-password-file ../Secrets/ansible_vault_pass -u rihards --diff Raspberry.yml -e ansible_port=22 --ask-pass'

# Raspberry next runs:
docker run -ti --rm -v ~/Code/CloudProject/cloud_project_ansible:/d -v ~/Code/CloudProject/Secrets/:/Secrets/ -v ~/.ssh/:/root/.ssh -w /d williamyeh/ansible:alpine3-onbuild sh -c 'apk add --no-cache openssh-client && \
eval "$(ssh-agent -s)"; ssh-add /root/.ssh/raspberry && \
ansible-playbook -i ./Inventory --limit raspberry --vault-password-file ../Secrets/ansible_vault_pass -u rihards --diff Raspberry.yml'

```

### Ansible vault
```
ansible-vault create vars/vault.yml
ansible-vault edit vars/vault.yml --vault-password-file /Secrets/ansible_vault_pass
```
