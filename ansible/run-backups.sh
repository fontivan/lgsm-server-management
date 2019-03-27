#!/bin/bash
source get_ansible_cfg_rc
ansible-playbook backup-game-servers.yml -i inventory.yml --ask-become-pass
