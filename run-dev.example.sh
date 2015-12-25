#!/bin/bash

CONTAINER_NAME=myapp-dev

set +x
set +e

SCRIPTS_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "Create/start/enter to $CONTAINER_NAME container..."

# ensure container exists and runs
docker-compose --file $SCRIPTS_DIR/run-dev.docker-compose.yml up -d

# enter interactively to container
docker exec -it --user=dev $CONTAINER_NAME /bin/bash

# stop container
echo "Stop $CONTAINER_NAME container..."
docker stop $CONTAINER_NAME
