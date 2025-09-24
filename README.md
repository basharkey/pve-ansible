# PVE Ansible

# ZFS
## Create Pool 
```
zpool create pool0 raidz2 /dev/sdb /dev/sdc /dev/sdd /dev/sde
```

## Create Encrypted Dataset
```
zfs create -o encryption=on -o keylocation=prompt -o keyformat=passphrase -o compression=lz4 -o mountpoint=/pool0/encrypted pool0/encrypted
```

## Verify Dataset Settings
```
zfs list -o encryption,compression,mountpoint
```

## Remount Encrypted Dataset after Reboot
```
zfs mount -l pool0/encrypted
```

# Resize local-lvm (LVM-Thin)
lvremove /dev/pve/data
lvresize -L +100G /dev/pve/root
resize2fs /dev/mapper/pve-root

lvcreate -l +98%FREE -n data pve
lvconvert --type thin-pool pve/data

Re-add local-lvm in web UI Datacenter > Storage > Add > LVM-Thin