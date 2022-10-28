---
title: Notes on the use of docker
author: Pierre Smars
date: \today
fontfamily: cmbright
fontsize: 12pt
---

# Some useful commands

```
docker pull IMAGE_NAME
docker run --rm -it IMAGE_NAME
docker images
docker image rm IMAGE_NAME
docker image prune
docker container ls
docker container rm CONTAINER_NUMBER
docker save IMAGE_NAME | gzip -c > IMAGE_NAME.tgz
gunzip -c IMAGE_NAME.tgz | docker load
```

