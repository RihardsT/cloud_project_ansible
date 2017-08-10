# RudensPavasaris cloud project Ansible playbook


## To do:
- [x] Set up Gitlab runner
  - [ ] Pull request to https://github.com/DBLaci/ansible-gitlab-runner for ubuntu 17.04 support
  - [ ] Ensure /var/lib/gitlab-runner is created otherwise runner service doesn't start
  - [ ] Lookup the token from safer place and push the vars to repo then https://docs.ansible.com/ansible/latest/playbooks_lookups.html
- [ ] Set up Vault
- [ ]