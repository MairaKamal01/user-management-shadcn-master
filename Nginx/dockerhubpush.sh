#!/bin/bash
docker system prune
docker build -t mairakamal27/nginx .
docker push mairakamal27/nginx
$SHELL