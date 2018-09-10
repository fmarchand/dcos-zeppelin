#!/usr/bin/env bash

DOCKER_REPO=${DOCKER_REPO:-maibornwolff}

cd docker
# package_version-zeppelin_version-(all|netinst)-spark_version
DOCKER_TAG=1.0-0.8.0-all-2.2.1-custom
echo "Building zeppelin:${DOCKER_TAG}"
docker build -t zeppelin:${DOCKER_TAG}  .
if [ ${PUSH:-"0"} == "1" ]; then
  docker tag zeppelin:${DOCKER_TAG} $DOCKER_REPO/zeppelin:${DOCKER_TAG}
  docker push $DOCKER_REPO/zeppelin:${DOCKER_TAG}
fi
done
