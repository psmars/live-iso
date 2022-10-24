---
title: Notes to run a prepare a postgresql server and database for qgis
author: Pierre Smars
date: \today
fontfamily: cmbright
fontsize: 12pt
---

as root, if necessary makes your user member of the docker group:

```
usermod -a -G docker user
logout
```

as user:

```
ln -s /your/permanent/data/container ~/postgres
docker run --name qgis-postgres \
    --rm \
    -e POSTGRES_USER=postgres \
    -e POSTGRES_PASSWORD=secret \
    -e PGDATA=/var/lib/postgresql/data/pgdata \
    -v /home/user/postgres:/var/lib/postgresql/data \
    -p 5432:5432 \
    -it postgis/postgis
```

(add '-d' to detach)

- In QGIS, connect to database using the PostGIS browser item
- In the database, create a new schema and table
- Possibly refine the structure using direct connection to the server: see postgres document
```

