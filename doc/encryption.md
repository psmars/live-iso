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
# if you did that before and have a backup of your personal settings
# (see blow)
cd /media/sdX3
cp some_safe_place USER_NAME.tar.bz2
chown USER_NAME:USER_NAME USER_NAME.tar.bz2
tar xvf USER_NAME.tar.bz2
```

# Reuse the home directory after reboot

```
pmount -e /dev/sdX3
# type password
adduser --home /media/sdX3/USER_NAME USER_NAME
# get back what you saved before
# make all the settings you want, logout and login as user or root
# create a backup of your personal settings
cd /media/sdX3
tar cvf USER_NAME.tar USER_NAME
bzip2 USER_NAME.tar
cp USER_NAME.tar.bz2 some_safe_place
```

