---
title: Virtualisation$\colon$ qemu
author: Pierre Smars
date: \today
fontfamily: cmbright
fontsize: 12pt
---

# Test the iso

```
qemu-system-x86_64 \
	-boot d \
	-cdrom debian-smars-amd64.hybrid.iso \
	-enable-kvm \
	-m 4096 \
	-vga virtio
```

# Install the iso on a qemu image

```
qemu-img create live.img 30G
qemu-system-x86_64  \
	-boot d \
	-cdrom debian-smars-amd64.hybrid.iso \
	-enable-kvm \
	-m 4096 \
	-drive format=raw,index=0,file=live.img
```

# Run the image

```
qemu-system-x86_64  \
	-enable-kvm \
	-m 4096 \
	-vga virtio \
	-drive format=raw,index=0,file=live.img
```
