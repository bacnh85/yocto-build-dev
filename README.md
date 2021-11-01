# Introduction

Docker image for building Yocto based on Debian

# Usage

Create a `docker-compose.yml` and map the working folder into /opt:

```
# Docker composer file for Linux User
version: '3.2'
services:
  yocto-dev:
    image: bacnh85/yocto-dev
    container_name: yocto-dev
    environment: 
      - UID=1000
      - GID=1000
    volumes:
      - ../:/opt
      - ~/.ssh:/home/1000/.ssh
      - ~/.gitconfig:/home/1000/.gitconfig
    tty: true
```

Then, bring up the container:
```
docker-compose up -d
```

To build the Yocto image, login into the container as user with id '1000':

```
docker exec -it -u 1000 yocto-dev /bin/bash
```