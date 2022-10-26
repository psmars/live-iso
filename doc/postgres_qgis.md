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
It may also be becessary to add 'nameserver 8.8.8.8' to /etc/resolv.conf

as user:

```
ln -s /your/permanent/data/container ~/qgis
docker run --name qgis-postgres \
    --rm \
    -e POSTGRES_USER=postgres \
    -e POSTGRES_PASSWORD=secret \
    -e PGDATA=/var/lib/postgresql/data/pgdata \
    -v /home/user/qgis:/var/lib/postgresql/data \
    -p 5432:5432 \
    -it postgis/postgis
```

(add '-d' to detach)

Define some items.

```
psql -U postgres -h localhost
create database test;
create user pierre with encrypted password 'secret';
grant all privileges on database test to pierre;
create user bob with encrypted password 'secret2';
\c test
create extension postgis;
grant all on schema public to pierre, bob;
```

as pierre

```
psql -U pierre -h localhost -d test
create schema inventory;
grant usage on schema inventory to bob;
grant select, update, insert, delete on all tables in schema inventory to bob;
grant usage on all sequences in schema inventory to bob;
set search_path to inventory;
```

In QGIS

- Connect to database using the PostGIS browser item
- In the database, create (if necessary, a new schema) and tables
- Possibly refine the structure using direct connection to the server: see also docker_posgres

