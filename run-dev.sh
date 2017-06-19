#!/bin/bash

CONTAINER_NAME=node-dev-tools
CONTAINER_USER=dev

set +e

SCRIPTS_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "Create/start/enter to $CONTAINER_NAME container..."

set -x

# ensure container exists and runs
docker-compose --file $SCRIPTS_DIR/dev.docker-compose.yml up -d

# enter interactively to container
docker exec -it --user=$CONTAINER_USER $CONTAINER_NAME /bin/bash

set +x

echo -n "Stop container (y/N)? "
read answer
if echo "$answer" | grep -iq "^y" ;then
    # stop container
    echo "Stop $CONTAINER_NAME container..."
    docker stop $CONTAINER_NAME
else
    echo "Keep $CONTAINER_NAME container running."
fi
