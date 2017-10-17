#!/bin/bash
if [ ! -z "$version" ]; then
    echo "Building hexo: $version..."
    docker build -t docker-hexo\hexo:$version .
    echo "done."
fi
echo "Building hexo: latest..."
docker build -t docker-hexo\hexo:latest .
echo "done."