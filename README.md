Ansible playbooks to manage VMs

# Prerequisites

1. VM should already have OS installed (RHEL or Debian)
2. The root user on the vm should already have your authorized_key added
3. Update the inventory file to account for any local IP address changes

# Usage

1. Prepare the venv:

```bash
make venv
```

2. Activate the venv:
```bash
source venv/bin/activate
```

3. Move into ansible folder

```bash
cd ansible/
```

4. Prepare an ansible playbook command based on the selected hosts and tags

| Tag       | Description |
| ---       | ---         |
| backup    | Stop the LGSM server, perform a backup, and start the LGSM server |
| packages  | Install all package dependencies and install all available package updates. The server may be rebooted if required. |
| reboot    | Stop the LGSM server, reboot the host, and start the LGSM server |
| restart   | Stop and start the LGSM server  |
| start     | Start the LGSM server |
| stop      | Stop the LGSM server |
| update    | Update the LGSM server |

| target_hosts      | extra var                                     |
| ---               | ---                                           |
| minecraft         | -e "target_hosts=minecraft"                   |
| ark               | -e "target_hosts=ark                          |
| minecraft and ark | -e "{'target_hosts': ['ark', 'minecraft']}"   |

E.g. To install an LGSM minecraft server, run the following:
```bash
ansible-playbook playbooks/playbook.yaml -e "target_hosts=minecraft" --tags "install"
```
