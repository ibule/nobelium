#!/bin/bash

echo -e "---------docker Login--------"
docker login haomingkeji-docker.pkg.coding.net --username=$1  --password=$2 || exit 1

echo -e "---------docker Stop--------"
docker stop nobelium

echo -e "---------docker Rm--------"
docker rm nobelium && docker rmi haomingkeji-docker.pkg.coding.net/zaixiankaoshi/public/ibule/nobelium:latest

echo -e "---------docker Pull--------"
docker pull haomingkeji-docker.pkg.coding.net/zaixiankaoshi/public/ibule/nobelium:latest || exit 1

echo -e "---------docker Create and Start--------"
docker run --restart=always -d -p 3000:3000 --name nobelium haomingkeji-docker.pkg.coding.net/zaixiankaoshi/public/ibule/nobelium:latest || exit 1

echo -e "---------deploy Success--------"
