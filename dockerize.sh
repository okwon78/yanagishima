#!/bin/bash
set -e
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR

IMAGE_NAME=yanagishima
YANAGISHIMA_VERSION=22.0

docker build . \
-t $IMAGE_NAME:latest \
--build-arg YANAGISHIMA_VERSION=$YANAGISHIMA_VERSION \
-f Dockerfile \
--no-cache

OWNER=okwon78
IMAGE_NAME=yanagishima

# docker image tag $IMAGE_NAME:latest $IMAGE_NAME:$YANAGISHIMA_VERSION $OWNER/$IMAGE_NAME:$YANAGISHIMA_VERSION

# docker image push $OWNER/$IMAGE_NAME:$YANAGISHIMA_VERSION
# docker image push $OWNER/$IMAGE_NAME:latest