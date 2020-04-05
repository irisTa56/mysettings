#!/bin/bash

# “dc” stands for Docker-Compose

if [ "$1" = "hadoop" ]; then
  docker-compose -f hadoop/docker-compose.yml -f jupyter/docker-compose.yml ${@:2}
fi
