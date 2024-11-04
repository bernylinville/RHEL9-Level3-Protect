


```bash
virt-install \
    --connect qemu:///system \
    --name almalinux-9-test \
    --memory 8192 \
    --vcpus 4 \
    --disk path=/var/lib/libvirt/images/almalinux-9-test.qcow2,size=50 \
    --cdrom /var/lib/libvirt/images/AlmaLinux-9.4-x86_64-dvd.iso \
    --os-variant almalinux9 \
    --network bridge=br0 \
    --graphics vnc,port=15901,password=test \
    --boot cdrom,hd \
    --noautoconsole

# snapshot
virsh --connect qemu:///system snapshot-create-as almalinux-9-test --name "initial" --description "Initial installation"
virsh --connect qemu:///system start almalinux-9-test

# restore
virsh --connect qemu:///system snapshot-revert almalinux-9-test --snapshotname "initial"
```
