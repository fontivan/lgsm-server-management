#!/bin/bash
# Reliably get the dir this is in
export MY_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
export ANSIBLE_DIR="${MY_DIR}/ansible"

# Set the ansible config so we get timestamps
export ANSIBLE_CONFIG="${ANSIBLE_DIR}/ansible.cfg"

#Call the playbook with the args passed into this bash script
ansible-playbook -i ${ANSIBLE_DIR}/inventory.yml $@ ${ANSIBLE_DIR}/playbook.yml --ask-become-pass

# EG:
# ./run.sh -t ubuntu
# ./run.sh -t ubuntu -vvv
# ./run.sh -t ubuntu -t ark -t minecraft

