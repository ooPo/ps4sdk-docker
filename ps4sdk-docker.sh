#!/bin/sh

if [ ! -z "$*" ]; then
  docker run -v `pwd`:/build --rm ps4sdk-docker $*
else
  docker run -v `pwd`:/build --rm -it -p 5350:5350 ps4sdk-docker
fi
