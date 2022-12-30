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
# add a primary partition to the disk (n: new, w: write and exit)
fdisk --wipe=never -t dos /dev/sdX
# encrypt partition, choose password
cryptsetup -y -v luksFormat /dev/sdX3
# map the partition (you may have to unplug and replug the disk)
cryptsetup luksOpen /dev/sdX3 data
# create a file system
mkfs.ext4 /dev/mapper/data
```

# Create an encrypted home directory

```
# boot from the new disk, log as 'root', password 'wren', type 'loguser' to create a new encrypted directory for you 
loguser
# the skeleton files will be copied
# if you did that before and have a backup of your personal settings
# (see blow)
```

# Reuse the home directory after reboot

```
# boot from the new disk, log as 'root'
loguser
# get back what you saved before
# make all the settings you want, logout and login as user or root
# create a backup of your personal settings
cd /media/sdX3
tar cvf USER_NAME.tar USER_NAME
bzip2 USER_NAME.tar
cp USER_NAME.tar.bz2 some_safe_place
```

# Update to a new live disk

```
# prepare a new version of the live disk
# your personal directory is destroyed
# create an encrypted home directory following the process detailed above
# mount the newly formatted /dev/sdX3 on another computer
cd /media/sdX3
# copy the backup of your home directory
cp some_safe_place USER_NAME.tar.bz2
# untar it in your new (mostly empty) home directory
chown USER_NAME:USER_NAME USER_NAME.tar.bz2
tar xvf USER_NAME.tar.bz2
```
