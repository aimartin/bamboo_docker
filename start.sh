#!/bin/bash

#Start the Docker Service
service docker start

#We call the Original Entry Point
/docker-entrypoint.sh
