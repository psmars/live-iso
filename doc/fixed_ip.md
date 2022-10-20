---
title: Notes to set a fix IP
author: Pierre Smars
date: \today
fontfamily: cmbright
fontsize: 12pt
---

The simplest: use the network applet from the task bar or nmtui from the terminal

manual setting, as root:

```
# check the name of your interface
ifonfig
# set the IP
ifconfig YOUR_INTERFACE inet FIXED_IP/24
route add default gw YOUR_GATEWAY
echo nameserver 8.8.8.8 > /etc/resolv.conf
# or another name server
```
