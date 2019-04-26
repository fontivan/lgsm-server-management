#!/bin/bash
# Reliably get the dir this is in
export MY_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
export ANSIBLE_DIR="${MY_DIR}/ansible"

# Set the ansible config so we get timestamps
export ANSIBLE_CONFIG="${ANSIBLE_DIR}/ansible.cfg"

ANSIBLE_VER=$(ansible --version | grep 'ansible 2')

if [[ "$ANSIBLE_VER" =~ ^(ansible 2.[7-9].[0-9]*)$ ]]; then
    echo "Ansible version OK"
    exit 0
else
    echo "Ansible version 2.7+ required"
    exit 1
fi
