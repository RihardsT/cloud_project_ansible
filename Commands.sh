pyenv local 2.7.13 # Because ansible and molecule work better with python2
pip2 install -U packaging; pip2 install -U ansible

ansible-galaxy install --roles-path ./roles tersmitten.fail2ban
ansible-galaxy install --roles-path ./roles geerlingguy.security
ansible-galaxy install --roles-path ./roles angstwad.docker_ubuntu
git clone https://github.com/DBLaci/ansible-gitlab-runner roles/dblaci.ansible-gitlab-runner
# ansible-galaxy install --roles-path ./roles geerlingguy.firewall
# ansible-galaxy install --roles-path ./roles angstwad.docker_ubuntu,v2.4.2 # specific version as there were errors otherwise
ansible-galaxy install --roles-path ./roles
# ansible-galaxy install amidos.install-docker -p ./roles # for some reason this role failed for me

# ansible-playbook # apply a playbook to servers
# --check # dry run
# --forks
# --limit=backend # limit on which Inventory items will run
# --private-key PATH_TO_KEY # private key for ssh'ing
# --ask-pass # To ask for password when setting up pi

# Skip the overly verbose cows. In my case, in bash_profile did the trick, not .bashrc
echo "export ANSIBLE_NOCOWS=1" >> ~/.bash_profile

ansible-playbook -i ./Inventory --limit production -u rihards --diff Playbook.yml

# when first setting up, had to use -u root, as it was the default ssh user
ansible-playbook -i ./Inventory --limit production -u root --diff Playbook.yml

ansible-playbook -i ./Inventory Raspberry.yml --limit raspberry

ansible-playbook -i ./Inventory -e 'ansible_python_interpreter=/usr/bin/python3' -u ubuntu aws.yml
ansible-playbook -i ./Inventory -u ubuntu --limit aws --diff Playbook.yml

-e 'ansible_port=22'

# https://plusbryan.com/my-first-5-minutes-on-a-server-or-essential-security-for-linux-servers
# https://galaxy.ansible.com/geerlingguy/security/


# Adding tests with Molecule:
pip2 install -U ansible docker molecule
molecule init --driver docker
  # Add ansible: to molecule.yml
molecule --help



solita/ubuntu-systemd
# Should start systemd for the container, so that can start docker and other services in container. Scratch that, --privileged was necessary.
https://developers.redhat.com/blog/2014/05/05/running-systemd-within-docker-container/
http://container-solutions.com/running-docker-containers-with-systemd/
https://developer.atlassian.com/blog/2015/03/docker-systemd-socket-activation/