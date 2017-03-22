#!/bin/sh

tag=$1

if [ "$tag" = "" ]; then
  tag="latest"
fi

docker build -t thitu/android-sdk:$tag -f Dockerfile . && docker push thitu/android-sdk:$tag
