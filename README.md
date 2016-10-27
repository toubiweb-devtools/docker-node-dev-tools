# Docker node dev tools

[![](https://images.microbadger.com/badges/version/toubiweb/docker-node-dev-tools.svg)](https://microbadger.com/images/toubiweb/docker-node-dev-tools "Get your own version badge on microbadger.com") [![](https://images.microbadger.com/badges/image/toubiweb/docker-node-dev-tools.svg)](https://microbadger.com/images/toubiweb/docker-node-dev-tools "Get your own image badge on microbadger.com")

## What is Docker node dev tools?

A docker container packaged with common Node.js dev tools.

## What is included?

This image is based on official node.js docker image (Debian stable, Jessie).

Current version includes:

* node 6.9 and 7.0
* node development tools: npm, gulp, grunt, bower, forever, yeoman, angular-cli
* system tools: wget, vim

The container starts by default:
* with a "dev" user granted to sudo without password
* in a default working directory: /app

## How to use this image

### Quick start

Use the image in development to install tools and dependencies, run your tests, your application...

```bash
docker run --rm -it -v $HOME/my-app:/app -t toubiweb/docker-node-dev-tools bash
```

### How to use this image to develop nodejs applications

To keep the state of your dev container (including node cache, installed tools) between to usage, it is a good idea to create a docker-compose file:

```yml
dev:
  container_name: my-app
  image: toubiweb/docker-node-dev-tools
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

See [dev.docker-compose.yml](https://github.com/toubiweb/docker-node-dev-tools/blob/master/dev.docker-compose.yml)
 and [run-dev.sh](https://github.com/toubiweb/docker-node-dev-tools/blob/master/run-dev.sh)
 files for a working example.

### Usage during delivery process

Use the image during delivery process to build your application.

Mount your application sources as a volume (using -v option) and run your build command (e.g. gulp build).

```bash
docker run --rm -v /home/me/dev/my-app:/www/my-app -w /www/my-app -t toubiweb/docker-node-dev-tools gulp build
```

## Supported Node.js versions

Currently, node v6.9 and node v7 are supported:

```bash
docker run --rm -it -v $HOME/my-app:/app -t toubiweb/docker-node-dev-tools:6.9 bash
```

```bash
docker run --rm -it -v $HOME/my-app:/app -t toubiweb/docker-node-dev-tools:7.0 bash
```

## Supported Docker versions

This image has been tested successfully on Docker version 1.12.3, but it should work on previous versions.

## License

[Apache-2](https://github.com/toubiweb/docker-node-dev-tools/blob/master/LICENSE)
