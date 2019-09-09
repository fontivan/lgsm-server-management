Ansible playbooks to manage VMs

1. Run "setup.sh"
2. Run playbooks are required, eg:
    ansible-playbook -i ansible/inventory.yaml ansible/playbooks/ubuntu-update-packages.yaml --ask-become-pass
