# RudensPavasaris cloud project Ansible playbook

## To do:
- [x] Set up Gitlab runner
  - [ ] Pull request to https://github.com/DBLaci/ansible-gitlab-runner for ubuntu 17.04 support
  - [ ] Ensure /var/lib/gitlab-runner is created otherwise runner service doesn't start
  - [ ] Lookup the token from safer place and push the vars to repo then https://docs.ansible.com/ansible/latest/playbooks_lookups.html
- [ ] Set up Vault
- [ ]

### Set up
Because ansible and molecule work better with python2, I use pyenv.
```
pyenv local 2.7.13
pip2 install -U packaging;
pip2 install -U ansible
```

### Run
```
ansible-galaxy install --roles-path ./roles -r requirements.yml
# when first setting up, had to use -u root, as it was the default ssh user
ansible-playbook -i ./Inventory --limit production -u root --diff Playbook.yml
# Typical run for me
ansible-playbook -i ./Inventory --limit production -u rihards --diff Playbook.yml
```
Further runs are done now with Ansible vault:
```
ansible-playbook -i ./Inventory --limit production -u rihards --diff Playbook.yml --ask-vault-pass
ansible-playbook -i ./Inventory --limit production -u rihards --diff Playbook.yml --vault-password-file ../Secrets/ansible_vault_pass
```

Alternate run commands:
```
ansible-playbook -i ./Inventory Raspberry.yml --limit raspberry
ansible-playbook -i ./Inventory -u ubuntu --limit aws --diff Playbook.yml
```


### Ansible vault
```
ansible-vault create vars/vault.yml
```