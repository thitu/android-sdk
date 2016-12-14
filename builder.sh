#!/usr/bin/env bash

tag=$1

if [ "$tag" = "" ]; then
  tag="jumbo"
fi

docker -t thitu/android-sdk:$tag -f Dockerfile .
docker push thitu/android-sdk:$tag
