#!/bin/bash
source get_ansible_cfg_rc
ansible-playbook ${ANSIBLE_DIR}/backup-game-servers.yml -i ${ANSIBLE_DIR}/inventory.yml --ask-become-pass
