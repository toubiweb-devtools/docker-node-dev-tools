#!/bin/bash

NODE_VERSION=v6
DOCKER_TAG=6.9

echo ""
echo "###########################################"
echo ""
echo "DOCKER BUILD:"
echo ""
echo "docker build -t=\"toubiweb/docker-node-dev-tools:$DOCKER_TAG\" ./$NODE_VERSION"
echo ""
echo ""
echo "DOCKER PUBLISH:"
echo ""
echo "docker push toubiweb/docker-node-dev-tools:$DOCKER_TAG"
echo ""
echo "###########################################"
echo ""


NODE_VERSION=v7
DOCKER_TAG=7.0

echo ""
echo "###########################################"
echo ""
echo "DOCKER BUILD:"
echo ""
echo "docker build -t=\"toubiweb/docker-node-dev-tools:$DOCKER_TAG\" ./$NODE_VERSION"
echo ""
echo ""
echo "DOCKER PUBLISH:"
echo ""
echo "docker push toubiweb/docker-node-dev-tools:$DOCKER_TAG"
echo ""
echo "###########################################"
echo ""
