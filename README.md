Ansible playbooks to manage VMs

1. Checkout git repo:
```bash
git clone $url
```
2. Move into repo:
```bash
cd vm-management/
```
3. Install requirements:
```bash
ansible-galaxy install -r requirements.yaml
```
4. Move into ansible folder
```bash
cd ansible/
```
5. To install a specific server e.g. minecraft:
```bash
ansible-playbook -i inventory.yaml playbooks/playbook.yaml -e "target_hosts=minecraft" --tags "install"
```
6. To update the lgsm server after installation:
```bash
ansible-playbook -i inventory.yaml playbooks/playbook.yaml -e "target_hosts=minecraft" --tags "update"
```
7. To update the host packages:
```bash
ansible-playbook -i inventory.yaml playbooks/playbook.yaml -e "target_hosts=minecraft" --tags "packages"
```
8. To reboot a host:
```bash
ansible-playbook -i inventory.yaml playbooks/playbook.yaml -e "target_hosts=minecraft" --tags "reboot"
```
9. To restart the lgsm server:
```bash
ansible-playbook -i inventory.yaml playbooks/playbook.yaml -e "target_hosts=minecraft" --tags "restart"
```
