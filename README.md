# live-iso

Steps to prepare the iso file (it will take a while, hour(s)...):

```
> apt install live-build
> git clone https://github.com/psmars/live-iso.git
> cd live-iso
> make
> dd if=debian-smars-amd64.hybrid.iso | pv | dd of=/dev/sdX bs=1M; sync
```

(/dev/sdX is the device on which you want the image to be burned. Example: /dev/sdb)

The packages installed are listed in './config/package-lists'

Extra steps and configurations are defined in './config/hooks/live'

Building defaults are found in './auto' and in the './Makefile' 

Notes to create an encrypted partition and other stuff can be found in './doc'

