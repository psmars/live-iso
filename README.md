# live-iso

```
> apt install live-build
> git clone https://github.com/psmars/live-iso.git
> cd live-iso
> lb clean
> lb config
> lb build
> dd if=debian-smars-amd64.hybrid.iso | pv | dd of=/dev/sdc bs=1M; sync
```