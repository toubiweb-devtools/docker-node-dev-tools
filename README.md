# docker-node-dev-tools

Docker image to build or run applications in development mode using nodejs.

## What is included?

This image is based on official node.js docker image (Debian stable, Jessie). 

Current version includes:
* node 0.12
* general tools: wget, vim, sudo
* node development tools: bower, grunt, gulp

The default docker user is "dev", and has sudo rights without password.

The default directory is /app/sources

## How to use
	
### Use the image during delivery process to build your application

Mount your application sources as a volume (using -v option) and run your build command (e.g. gulp build).

	docker run --rm -u root -v /home/me/dev/my-app:/app -t toubiweb/docker-node-dev-tools gulp build

It is recommanded to run it as root to enjoyu

You can override the default directory using -w option:

	docker run --rm -u root -v /home/me/dev/my-app:/www/my-app -w /www/my-app -t toubiweb/docker-node-dev-tools gulp build

### Use the image in development to run your tests, your application...

To keep the state of your dev container (including node cache, installed tools) between to usage, it is a good idea to create a docker-compose file:

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
        
Use data containers to mount your sources in order to ensure full rights access to docker "dev" users. Alternatives: use "sudo" or run it as "root" user.

Then run your container via docker-compose:

	docker-compose up -d

Then enter to the container

	docker exec -it myapp-dev /bin/bash

Finally, run the commands to build, test, or run your application:

	npm install
	
	docker install

	gulp test
	
	grunt serve
	
After have left the container, you can stop it:

	docker stop myapp-dev
	

You may want to use the run-dev.sh script.


### Optional: build docker image from sources

Get sources:

	git clone git@github.com:toubiweb/docker-node-dev-tools.git

Build container

	cd docker-node-dev-tools
	docker build -t="toubiweb/docker-node-dev-tools" .
