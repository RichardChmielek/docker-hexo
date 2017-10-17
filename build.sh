#!/bin/bash
if [ ! -z "$version" ]; then
    docker build -t docker-hexo\hexo:$version .
fi
docker build -t docker-hexo\hexo:latest .