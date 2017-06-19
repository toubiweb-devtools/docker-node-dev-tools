# Docker node dev tools

[![](https://images.microbadger.com/badges/version/toubiweb/node-dev-tools.svg)](https://microbadger.com/images/toubiweb/node-dev-tools "Get your own version badge on microbadger.com") [![](https://images.microbadger.com/badges/image/toubiweb/node-dev-tools.svg)](https://microbadger.com/images/toubiweb/node-dev-tools "Get your own image badge on microbadger.com")

## What is Docker node dev tools?

A few docker images used as base to run Node.js as development or production.

## What is included?

### toubiweb/node-core image

Parent image, based on official node.js image (Debian stable, Jessie).

Current version includes:

* node 6.11 and 8.0
* system tools: wget, vim, git
* [sexy bash prompt](https://github.com/twolfson/sexy-bash-prompt)
* [ls colors](https://github.com/trapd00r/LS_COLORS)
* a default working directory: /app

### toubiweb/node-dev image

Development-mode image, based on toubiweb/node-core

This image provide additionally:
* a "dev" user granted to sudo without password

### toubiweb/node-dev-tools image

Development-mode image, based on toubiweb/node-core

This image provide additionally:
* node development tools: npm, gulp, grunt, webpack, webpack-dev-server, @angular/cli, karma-cli, protractor, typescript, forever, nodemon, node-supervisor, yeoman, ava

### toubiweb/node-prod image

Producation-mode image, based on toubiweb/node-core

This image provide additionally:
* a "prod" user without password
* node production mode enabled by default

## How to use this image

### Quick start

Use the image in development to install tools and dependencies, run your tests, your application...

```bash
docker run --rm -it -v $HOME/my-app:/app -t toubiweb/node-dev-tools bash
```

### How to use this image to develop nodejs applications

To keep the state of your dev container (including node cache, installed tools) between to usage, it is a good idea to create a docker-compose file:

```yml
dev:
  container_name: my-app
  image: toubiweb/node-dev-tools
  command: tail -f /dev/null
  volumes:
    - .:/app
    - $HOME/.ssh:/home/dev/.ssh
    - $HOME/.gitconfig:/home/dev/.gitconfig
  ports:
	- 3000:3000
	- 3001:3001
	- 35729:35729
```
In this example, we also share ssh and git config so we can commit/push changes from within the container.

See [dev.docker-compose.yml](https://github.com/toubiweb/node-dev-tools/blob/master/dev.docker-compose.yml)
 and [run-dev.sh](https://github.com/toubiweb/node-dev-tools/blob/master/run-dev.sh)
 files for a working example.

### Usage during delivery process

Use the image during delivery process to build your application.

Mount your application sources as a volume (using -v option) and run your build command (e.g. gulp build).

```bash
docker run --rm -v /home/me/dev/my-app:/www/my-app -w /www/my-app -t toubiweb/node-dev-tools gulp build
```

## Supported Node.js versions

To use last node [Long Term Support version](https://github.com/nodejs/LTS#lts-schedule) (6.x):


```bash
docker run --rm -it -v $HOME/my-app:/app -t toubiweb/node-dev-tools:lts bash
```

Available tags: latest, lts, 6, 6.11

To use CURRENT (8.x) version:

Available tags: current, 8, 8.1

Tags are frequently updated. To be sure to use the last image, pull them:

```bash
docker pull toubiweb/node-dev-tools:lts
docker pull toubiweb/node-dev-tools:current
```

## Supported Docker versions

This image has been tested successfully on Docker version 17.05.0, but it should also work on other recent versions.

## License

[Apache-2](https://github.com/toubiweb/node-dev-tools/blob/master/LICENSE)
