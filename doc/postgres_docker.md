---
title: Notes to run a postgresql server
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
ln -s /your/permanent/data/container ~/postgres
docker run --name basic-postgres \
    --rm \
    -e POSTGRES_USER=postgres \
    -e POSTGRES_PASSWORD=secret \
    -e PGDATA=/var/lib/postgresql/data/pgdata \
    -v /home/user/postgres:/var/lib/postgresql/data \
    -p 5432:5432 \
    -it postgres
psql -U postgres -h localhost
```

```
create database test;
create user pierre with encrypted password 'secret';
grant all privileges on database test to pierre;
\connect test
grant all on schema public to pierre;
exit
```

login as new user

```
psql -U pierre -h localhost -d test
create table users \
    (id_user serial primary key,\
    name varchar(50) unique not null,\
    password varchar(50) not null,\
    created timestamp not null);
insert into users (name,password,created) \
    values('pierre','hello',NOW());
select* from users;
```

another day

```
docker run --name basic-postgres \
    --rm  \
    -e PGDATA=/var/lib/postgresql/data/pgdata \
    -v /home/user/postgres:/var/lib/postgresql/data \
    -p 5432:5432 \
    -it postgres
psql -U pierre -h localhost -d test
select* from users;
```

