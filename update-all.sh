#!/bin/bash
set -e
# Reliably get the dir this is in
export MY_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
# call setup
$MY_DIR/setup.sh

# vars to save repetition
ANSIBLE_ARGS="-i $MY_DIR/ansible/inventory.yml --ask-become-pass"
ANSIBLE="ansible-playbook $ANSIBLE_ARGS"

# common tags
TAG_STOP="-t stop"
TAG_BACKUP="-t backup"
TAG_UPDATE="-t update"
TAG_START="-t start"

# playbooks
PLAYBOOKS="$MY_DIR/ansible/playbooks"
PB_ARK="$PLAYBOOKS/ark.yml"
PB_MINECRAFT="$PLAYBOOKS/minecraft.yml"
PB_UBUNTU="$PLAYBOOKS/ubuntu.yml"

# stop ark & take backup
$ANSIBLE $PB_ARK $TAG_STOP #$TAG_BACKUP

# stop minecraft & take backup
$ANSIBLE $PB_MINECRAFT $TAG_STOP #$TAG_BACKUP

# run all ubuntu tasks
$ANSIBLE $PB_UBUNTU

# update & start ark
$ANSIBLE $PB_ARK $TAG_UPDATE $TAG_START

# start minecraft
$ANSIBLE $PB_MINECRAFT $TAG_START
