# Docker 

## Env

- CentOS
- Apache 2.4.6
- PHP 7.1.8
- MySQL 5.7
- Redis 4.0.1 (latest)

## Deps

- docker
- docker-compose

## Setup

## build docker container

```
$ docker-compose build
$ docker-compose up -d 
```

### network configure

```
$ vim /etc/hosts
127.0.0.1 web.local
127.0.0.1 mysql.local
127.0.0.1 redis.local
```

open `http://web.local`


## Memo

### CONNECT FROM A CONTAINER TO A SERVICE ON THE HOST

`docker.for.mac.localhost`

[https://docs.docker.com/docker-for-mac/networking/#i-want-to-connect-from-a-container-to-a-service-on-the-host](https://docs.docker.com/docker-for-mac/networking/#i-want-to-connect-from-a-container-to-a-service-on-the-host)
