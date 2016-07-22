# docker-node-dev-tools

Docker image to build or run applications in development mode using nodejs.

## What is included?

This image is based on official node.js docker image (Debian stable, Jessie).

Current version includes:

* node 6.2
* general tools: wget, vim, sudo
* node development tools: bower, grunt, gulp

The default docker user is "dev", and has sudo rights without password.

The default directory is /app/sources

## How to use

### Usage during delivery process

Use the image during delivery process to build your application.

Mount your application sources as a volume (using -v option) and run your build command (e.g. gulp build).

```bash
docker run --rm -v /home/me/dev/my-app:/app -t toubiweb/docker-node-dev-tools gulp build
```

You can override the default directory using -w option:

```bash
docker run --rm -v /home/me/dev/my-app:/www/my-app -w /www/my-app -t toubiweb/docker-node-dev-tools gulp build
```

### Usage during development

Use the image in development to run your tests, your application...

To keep the state of your dev container (including node cache, installed tools) between to usage, it is a good idea to create a docker-compose file:

```yml
dev:
  container_name: myapp-dev
  image: toubiweb/docker-node-dev-tools
  command: tail -f /dev/null
  volumes:
	- /home/me/dev/my-app:/app
  ports:
	- 3000:3000
	- 3001:3001
	- 35729:35729
```

Then run your container via docker-compose:

```bash
	docker-compose up -d
```

Then enter to the container

```bash
	docker exec -it myapp-dev /bin/bash
```

Finally, run the commands to build, test, or run your application:

```bash
	npm install

	docker install

	gulp test

	grunt serve
```

After have left the container, you can stop it:

```bash
	docker stop myapp-dev
```

You may want to use the run-dev.sh script.

### Optional: build docker image from sources

Get sources:

```bash
	git clone git@github.com:toubiweb/docker-node-dev-tools.git
```

Build container

```bash
	cd docker-node-dev-tools
	docker build -t="toubiweb/docker-node-dev-tools:6.2.1" .
```

Optionnaly, push to docker registry

```bash
	docker push toubiweb/docker-node-dev-tools:6.2.1
```
