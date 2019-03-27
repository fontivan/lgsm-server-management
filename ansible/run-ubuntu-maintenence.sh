#!/bin/bash
source get_ansible_cfg_rc
ansible-playbook ubuntu-maintenence.yml -i inventory.yml --ask-become-pass
