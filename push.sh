#!/bin/bash
echo "server: $server"
docker login --username $username --password $password $server
docker tag hexo $server/$username/hexo:latest
docker push $server/$username/hexo:latest