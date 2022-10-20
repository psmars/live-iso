---
title: Notes to build and install a new live iso
author: Pierre Smars
date: \today
fontfamily: cmbright
fontsize: 12pt
---

as root:

```
apt update
apt upgrade
apt install live-build 
cd /root/live-iso
make
# plug your usb key
# unmount it
# replace /dev/sdX (below) by the disk name you use
dd if=debian-smars-amd64.hybrid.iso | pv | dd of=/dev/sdX bs=1M; sync
```
If desired, edit the files in the auto and conf directories to fit specific needs before starting the build

