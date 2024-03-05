## ToDo:
Test these changes locally
https://github.com/geerlingguy/ansible-role-kubernetes/pull/153

## RudensPavasaris cloud project Ansible playbook
export ANSIBLE_HOST_KEY_CHECKING=False
export ANSIBLE_SSH_RETRIES=5

### Run
```
ansible-playbook -i ./Inventory --limit production -u rihards --diff htz1.yml
ansible-playbook -i 51.158.168.192, -u rihards --diff sc1.yml
```

First run with root user
```
ansible-playbook -i ./Inventory --limit production -u root --diff Playbook.yml -e ansible_port=22

ansible-playbook -i 51.158.168.192, -u root --diff sc1.yml
```

### Set up
Set variables from the template and files/s3cfg also from template

Get required roles, before running anything.
```
python3 -m pip install -U --user ansible
python3 -m site &> /dev/null && PATH="$PATH:`python3 -m site --user-base`/bin"

# Install required roles
ansible-galaxy install --roles-path ./roles -r requirements.yml
# Force role update required roles
ansible-galaxy install --roles-path ./roles -r requirements.yml --force
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
```
ansible localhost -m ansible.builtin.setup > facts.json

# Or in playbook
- name: Show facts available on the system
  ansible.builtin.debug:
    var: ansible_facts
- name: Ansible facts to file
  copy:
   content: "{{ ansible_facts }}"
   dest: ./ansible_facts_details.json
# Get package facts, which will then show up in ansible_facts
- name: Gather the package facts
  package_facts:
```
