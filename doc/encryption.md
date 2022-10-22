---
title: Notes to create and use an encrypted partition on the disk
author: Pierre Smars
date: \today
fontfamily: cmbright
fontsize: 12pt
---

All operations are made as root

# Create the partition

```
# identify the name of the disk
# you can use lsblk
# unmount if necessaary
fdisk --wipe=never -t dos /dev/sdX
# add a primary partition
cryptsetup -y -v luksFormat /dev/sdX3
# choose password
cryptsetup luksOpen /dev/sdX3 data
mkfs.ext4 /dev/mapper/data
```

# Create an encrypted home directory

```
pmount /dev/sdX3
# type password
adduser --home /media/sdX3/USER_NAME USER_NAME
# the skeleton files will be copied
```

# Reuse the home directory after reboot

```
pmount /dev/sdX3
# type password
adduser --home /media/sdX3/USER_NAME USER_NAME
# get back what you saved before
```

