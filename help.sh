#!/bin/bash

LTS_DIRECTORY=v6
LTS_DOCKER_TAG_1=lts
LTS_DOCKER_TAG_2=6.x
LTS_DOCKER_TAG_3=6.9

echo ""
echo "###########################################"
echo ""
echo "# DOCKER BUILD:"
echo ""
echo "docker build -t=\"toubiweb/docker-node-dev-tools:$LTS_DOCKER_TAG_1\" ./$LTS_DIRECTORY"
echo "docker tag toubiweb/docker-node-dev-tools:$LTS_DOCKER_TAG_1 toubiweb/docker-node-dev-tools:$LTS_DOCKER_TAG_2"
echo "docker tag toubiweb/docker-node-dev-tools:$LTS_DOCKER_TAG_1 toubiweb/docker-node-dev-tools:$LTS_DOCKER_TAG_3"
echo ""
echo "###########################################"
echo ""

CURRENT_DIRECTORY=v7
CURRENT_DOCKER_TAG_1=7.x
CURRENT_DOCKER_TAG_2=7.0

echo ""
echo "###########################################"
echo ""
echo "# DOCKER BUILD:"
echo ""
echo "docker build -t=\"toubiweb/docker-node-dev-tools\" ./$CURRENT_DIRECTORY"
echo "docker tag toubiweb/docker-node-dev-tools toubiweb/docker-node-dev-tools:$CURRENT_DOCKER_TAG_1"
echo "docker tag toubiweb/docker-node-dev-tools toubiweb/docker-node-dev-tools:$CURRENT_DOCKER_TAG_2"
echo ""
echo "###########################################"
echo ""


echo ""
echo "###########################################"
echo ""
echo "# DOCKER PUBLISH ALL:"
echo ""
echo "docker push toubiweb/docker-node-dev-tools"
echo ""
echo "###########################################"
echo ""
