#!/bin/bash

NODE_VERSION_MAJOR=8
NODE_VERSION_MINOR=1
DIRECTORY=v$NODE_VERSION_MAJOR
DOCKER_TAG_1=current
DOCKER_TAG_2=$NODE_VERSION_MAJOR
DOCKER_TAG_3=$NODE_VERSION_MAJOR.$NODE_VERSION_MINOR

echo ""
echo "###########################################"
echo ""
echo "# BUILD:"
echo ""
docker pull node:$DOCKER_TAG_3
docker build -t=toubiweb/node-core -f ./$DIRECTORY/node-core.dockerfile ./$DIRECTORY
docker tag toubiweb/node-core toubiweb/node-core:$DOCKER_TAG_1
docker tag toubiweb/node-core toubiweb/node-core:$DOCKER_TAG_2
docker tag toubiweb/node-core toubiweb/node-core:$DOCKER_TAG_3

docker build -t=toubiweb/node-dev -f ./$DIRECTORY/node-dev.dockerfile ./$DIRECTORY
docker tag toubiweb/node-dev toubiweb/node-dev:$DOCKER_TAG_1
docker tag toubiweb/node-dev toubiweb/node-dev:$DOCKER_TAG_2
docker tag toubiweb/node-dev toubiweb/node-dev:$DOCKER_TAG_3

docker build -t=toubiweb/node-dev-tools -f ./$DIRECTORY/node-dev-tools.dockerfile ./$DIRECTORY
docker tag toubiweb/node-dev-tools toubiweb/node-dev-tools:$DOCKER_TAG_1
docker tag toubiweb/node-dev-tools toubiweb/node-dev-tools:$DOCKER_TAG_2
docker tag toubiweb/node-dev-tools toubiweb/node-dev-tools:$DOCKER_TAG_3

docker build -t=toubiweb/node-prod -f ./$DIRECTORY/node-prod.dockerfile ./$DIRECTORY
docker tag toubiweb/node-prod toubiweb/node-prod:$DOCKER_TAG_1
docker tag toubiweb/node-prod toubiweb/node-prod:$DOCKER_TAG_2
docker tag toubiweb/node-prod toubiweb/node-prod:$DOCKER_TAG_3

echo "###########################################"
echo ""
echo ""
echo "# DOCKER PUBLISH ALL:"
echo ""
echo "To publish, run:"
echo ""
echo "docker push toubiweb/node-dev-tools && docker push toubiweb/node-prod"
echo ""
echo "###########################################"
echo ""
