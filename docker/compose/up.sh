#!/bin/bash

if [ "$1" = "hadoop" ]; then
  docker-compose -f hadoop/docker-compose.yml -f jupyter/docker-compose.yml up
fi
