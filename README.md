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
