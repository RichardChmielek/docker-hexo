#!/bin/bash
if [ ! -z "$version" ]; then
    echo "Building hexo: $version..."
    docker build --tag "docker-hexo/hexo:$version" --no-cache=true .
    echo "Done."
fi
echo "Building hexo: latest..."
docker build --tag docker-hexo/hexo:latest --no-cache=true .
echo "Done."