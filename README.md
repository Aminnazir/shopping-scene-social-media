
# Project Setup
## Shopping Scene Social Media

--- 

## Project Setup Sequence
* [Shopping Scene SMS](https://github.com/Aminnazir/shopping-scene-sms)
* [Shopping Scene](https://github.com/Aminnazir/shopping-scene)
* [Shopping Scene Admin](https://github.com/Aminnazir/shopping-scene-admin)
* [Shopping Scene Social Media](https://github.com/Aminnazir/shopping-scene-social-media)
* [Shopping Scene Cron](https://github.com/Aminnazir/shopping-scene-cron)

---

### Reserve Ports
|                             | App  | Node |   DB |  PMA |
|:----------------------------|:----:|:----:|:----:|-----:|
| Shopping Scene              | 9000 |  -   | 9001 | 9002 |
| Shopping Scene SMS          | 9010 | 8010 | 9011 | 9012 |
| Shopping Scene Admin        | 9020 | 8020 |   -  |   -  |
| Shopping Scene Social Media | 9030 | 8030 | 9031 | 9032 |
| Shopping Scene Cron         |   -  | 8040 |   -  |   -  |


### Container Details
|                             | App                          | Node                               | DB                             | PMA                              |
|:----------------------------|:-----------------------------|:-----------------------------------|:-------------------------------|:---------------------------------|
| Shopping Scene              | shopping-scene               | -                                  | shopping-scene-db              | shopping-scene-pma               |
| Shopping Scene SMS          | shopping-scene-sms           | shopping-scene-sms-node            | shopping-scene-sms-db          | shopping-scene-sms-pma           |
| Shopping Scene Admin        | shopping-scene-sms-node      | shopping-scene-admin-node          | -                              | -                                |
| Shopping Scene Social Media | shopping-scene-social-media  | shopping-scene-social-media-tiktok | shopping-scene-social-media-db | shopping-scene-social-media-pma  |
| Shopping Scene Cron         | -                            | shopping-scene-cron                | -                              | -                                |

---

### Clone Project

```bash
  git clone https://github.com/Aminnazir/shopping-scene-social-media.git
```
or

```bash
  git clone git@github.com:Aminnazir/shopping-scene-social-media.git
```

#### Go to project folder

```bash
  cd shopping-scene-social-media
```


#### Go to project folder

```bash
  copy .env.example to .env
```

#### set .env config variable

```bash
# Container Names and Ports
SS_CONTAINER_PREFIX=shopping-scene
SS_DB_CONTAINER=${SS_CONTAINER_PREFIX}-db

# Container Names and Ports
CONTAINER_PREFIX=shopping-scene-admin
APP_CONTAINER=${CONTAINER_PREFIX}-app
NODE_CONTAINER=${CONTAINER_PREFIX}-node

#Container Ports
APP_PORT=9020
NODE_PORT=8020
```

### Setup Project Commands

---

####  setup command

```bash
  make setup
```
* Required first time to setup project

#### Run Project
```bash
  make up
```


#### Fix Permissions Issues

```bash
  make set-permission
```

#### Link Storage

```bash
  make storage_link
```

* To set permissions issues

### Docker commands

---

Rebuild docker container without cache
```bash
  make build-fresh
```

Rebuild docker container
```bash
  make build
```
Stop docker container
```bash
  make stop
```

Down docker container
```bash
  make down
```


### Start Container Terminal

App Container
```bash
  make sh-app
```
Node Container
```bash
  make sh-node
```

---

### View Container Logs

App Container
```bash
  make logs-app
```
Node Container
```bash
  make logs-node
```


### Other Useful Commands

```bash
  make composer-update
```

```bash
  make npm-install
```

```bash
  make show-urls
```
---

### Dev Logins

```bash

 Admin admin-ss-sm
 Email : admin@ss-sm.pk
 Pass : SS@Admin*Pass

```







