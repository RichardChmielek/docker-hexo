#!/bin/bash
docker login --username $username --password $password $server
docker tag docker-hexo $server/$username/hexo:latest
docker push $server/$username/hexo:latest