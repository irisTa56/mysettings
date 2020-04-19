#!/bin/bash
# “dc” stands for Docker-Compose

if [ "$1" = "single" ]; then
  docker-compose -f jupyter/docker-compose.yml ${@:2}
elif [ "$1" = "hadoop" ]; then
  docker-compose -f hadoop/docker-compose.yml -f jupyter/docker-compose.yml ${@:2}
fi
