
wget -O /data/libvirt/images/AlmaLinux-9.5-x86_64-minimal.iso https://mirrors.nju.edu.cn/almalinux/9.5/isos/x86_64/AlmaLinux-9.5-x86_64-minimal.iso

```bash
virt-install \
    --connect qemu:///system \
    --name almalinux95 \
    --memory 8192 \
    --vcpus 4 \
    --disk path=/data/libvirt/images/almalinux95.qcow2,size=50 \
    --cdrom /data/libvirt/images/AlmaLinux-9.5-x86_64-minimal.iso \
    --os-variant almalinux9 \
    --network bridge=br0 \
    --graphics vnc,port=15901,password=test \
    --boot cdrom,hd \
    --noautoconsole

# snapshot
virsh --connect qemu:///system snapshot-create-as almalinux95 --name "initial" --description "Initial installation"
virsh --connect qemu:///system start almalinux95

# restore
virsh --connect qemu:///system shutdown almalinux95
virsh --connect qemu:///system snapshot-revert almalinux95 --snapshotname "initial"

# ssh-keygen -f '/home/kchou/.ssh/known_hosts' -R '10.0.7.232'
ansible -i hosts.yml all -m ping -e "ansible_ssh_user=root ansible_ssh_common_args='-o StrictHostKeyChecking=no'"
ansible-playbook -i hosts.yml site.yml
```


vagrant

```bash
sudo apt install -y vagrant
cd tests
vagrant box add almalinux/9
# libvirt provider
vagrant init almalinux/9
vagrant up --provider libvirt
ansible -i hosts.yml all -m ping -e "ansible_ssh_common_args='-o StrictHostKeyChecking=no'"
ansible-playbook -i hosts.yml site.yml
```
