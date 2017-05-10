pyenv local 2.7.13 # Because ansible and molecule work better with python2
pip2 install -U packaging; pip2 install -U ansible

ansible-galaxy install --roles-path ./roles tersmitten.fail2ban
ansible-galaxy install --roles-path ./roles geerlingguy.security
ansible-galaxy install --roles-path ./roles geerlingguy.firewall
ansible-galaxy install --roles-path ./roles
# ansible-galaxy install --roles-path ./roles angstwad.docker_ubuntu,v2.2.2 # specific version as there were errors otherwise
# ansible-galaxy install amidos.install-docker -p ./roles # for some reason this role failed for me

# ansible-playbook # apply a playbook to servers
# --check # dry run
# --forks
# --limit=backend # limit on which Inventory items will run
# --private-key PATH_TO_KEY # private key for ssh'ing
# --ask-pass # To ask for password when setting up pi

export ANSIBLE_NOCOWS=1 # Skip the overly verbose cows
ansible-playbook -i ./Inventory Playbook.yml --limit production -u rihards

# when first setting up, had to use -u root, as it was the default ssh user
ansible-playbook -i ./Inventory Playbook.yml --limit production -u root

export ANSIBLE_NOCOWS=1 # Skip the overly verbose cows
ansible-playbook -i ./Inventory Raspberry.yml

-e 'ansible_port=22'

# https://plusbryan.com/my-first-5-minutes-on-a-server-or-essential-security-for-linux-servers
# https://galaxy.ansible.com/geerlingguy/security/


# Adding tests with Molecule:
pip2 install -U ansible docker molecule
molecule init --driver docker
  # Add ansible: to molecule.yml
molecule --help