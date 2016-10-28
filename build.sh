#!/bin/bash

LTS_NODE_VERSION_MAJOR=6
LTS_NODE_VERSION_MINOR=9
LTS_DIRECTORY=v$LTS_NODE_VERSION_MAJOR
LTS_DOCKER_TAG_1=lts
LTS_DOCKER_TAG_2=$LTS_NODE_VERSION_MAJOR
LTS_DOCKER_TAG_3=$LTS_NODE_VERSION_MAJOR.$LTS_NODE_VERSION_MINOR

CURRENT_NODE_VERSION_MAJOR=7
CURRENT_NODE_VERSION_MINOR=0
CURRENT_DIRECTORY=v$CURRENT_NODE_VERSION_MAJOR
CURRENT_DOCKER_TAG_1=CURRENT
CURRENT_DOCKER_TAG_2=$CURRENT_NODE_VERSION_MAJOR
CURRENT_DOCKER_TAG_3=$CURRENT_NODE_VERSION_MAJOR.$CURRENT_NODE_VERSION_MINOR

echo ""
echo "###########################################"
echo ""
echo "# LTS NODE DOCKER BUILD:"
echo ""
docker pull node:$LTS_DOCKER_TAG_3
docker build -t=toubiweb/docker-node-dev-tools ./$LTS_DIRECTORY
docker tag toubiweb/docker-node-dev-tools toubiweb/docker-node-dev-tools:$LTS_DOCKER_TAG_1
docker tag toubiweb/docker-node-dev-tools toubiweb/docker-node-dev-tools:$LTS_DOCKER_TAG_2
docker tag toubiweb/docker-node-dev-tools toubiweb/docker-node-dev-tools:$LTS_DOCKER_TAG_3
echo ""
echo "###########################################"
echo ""
echo "# CURRENT NODE DOCKER BUILD:"
echo ""
docker pull node:$CURRENT_DOCKER_TAG_3
docker build -t=toubiweb/docker-node-dev-tools:$CURRENT_DOCKER_TAG_1 ./$CURRENT_DIRECTORY
docker tag toubiweb/docker-node-dev-tools:$CURRENT_DOCKER_TAG_1 toubiweb/docker-node-dev-tools:$CURRENT_DOCKER_TAG_2
docker tag toubiweb/docker-node-dev-tools:$CURRENT_DOCKER_TAG_1 toubiweb/docker-node-dev-tools:$CURRENT_DOCKER_TAG_3
echo ""
echo "###########################################"
echo ""
echo ""
echo "# DOCKER PUBLISH ALL:"
echo ""
echo "To publish, run:"
echo ""
echo "docker push toubiweb/docker-node-dev-tools"
echo ""
echo "###########################################"
echo ""
