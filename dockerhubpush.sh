#!/bin/bash
docker system prune -f
docker build -t mairakamal27/user-management-shadcn .
docker push mairakamal27/user-management-shadcn
$SHELL