## RudensPavasaris cloud project Ansible playbook
export ANSIBLE_HOST_KEY_CHECKING=False
export ANSIBLE_SSH_RETRIES=5

### Run
```
docker run -ti --rm -v ~/Code/CloudProject/cloud_project_ansible:/d -v ~/Code/CloudProject/Secrets/:/Secrets/ -v ~/.ssh/:/root/.ssh -w /d williamyeh/ansible:alpine3-onbuild sh -c 'apk add --no-cache openssh-client && \
eval "$(ssh-agent -s)"; ssh-add /root/.ssh/hetzner && \
ansible-playbook -i ./Inventory --limit production -u rihards --diff Playbook.yml'
```

First run with root user
```
docker run -ti --rm -v ~/Code/CloudProject/cloud_project_ansible:/d -v ~/Code/CloudProject/Secrets/:/Secrets/ -v ~/.ssh/:/root/.ssh -w /d williamyeh/ansible:alpine3-onbuild sh -c 'apk add --no-cache openssh-client && \
eval "$(ssh-agent -s)"; ssh-add /root/.ssh/hetzner && \
ansible-playbook -i ./Inventory --limit production -u root --diff Playbook.yml -e ansible_port=22'
```

### Set up
Get required roles, before running anything.
```
python3 -m pip install --user ansible
python3 -m site &> /dev/null && PATH="$PATH:`python3 -m site --user-base`/bin"

# Install required roles
ansible-galaxy install --roles-path ./roles -r requirements.yml
# Force role update required roles
ansible-galaxy install --roles-path ./roles -r requirements.yml --force

podman run -ti --rm -v ~/Code/CloudProject/cloud_project_ansible:/d -w /d williamyeh/ansible:alpine3-onbuild sh -c 'ansible-galaxy install --roles-path ./roles -r requirements.yml --force'

```


### Raspberry
```
# Raspberry first:
ansible-playbook -i raspberrypi.local, -u pi --diff Raspberry.yml -e ansible_port=22 --ask-pass
# Raspberry future runs
cd ~/Code/cloud_project/cloud_project_ansible/
ansible-playbook -i raspberrypi.local, -u rihards --diff Raspberry.yml -e ansible_port=22

```

### Other or old stuff
Alternate run commands:
```
docker run -ti --rm -v ~/Code/CloudProject/cloud_project_ansible:/d -v ~/Code/CloudProject/Secrets/:/Secrets/ -v ~/.ssh/:/root/.ssh -w /d williamyeh/ansible:alpine3-onbuild sh -c'
ansible-playbook -i ./Inventory --limit raspberry -u rihards --diff Raspberry.yml -e ansible_port=22 --ask-pass'

# Raspberry next runs:
docker run -ti --rm -v ~/Code/CloudProject/cloud_project_ansible:/d -v ~/Code/CloudProject/Secrets/:/Secrets/ -v ~/.ssh/:/root/.ssh -w /d williamyeh/ansible:alpine3-onbuild sh -c 'apk add --no-cache openssh-client && \
eval "$(ssh-agent -s)"; ssh-add /root/.ssh/raspberry && \
ansible-playbook -i ./Inventory --limit raspberry -u rihards --diff Raspberry.yml'

```

### Ansible vault
```
ansible-vault create vars/vault.yml
ansible-vault edit vars/vault.yml --vault-password-file /Secrets/ansible_vault_pass
```

#### ansible.cfg
display_skipped_hosts = false

### Notes
Debug task output
```
- name: some task
  ...
  register: result
- debug: msg="{{ result }}"

- name: other task
  ...
  when: result is changed
```
