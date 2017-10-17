#!/bin/bash
if [ ! -z "$version" ]; then
    echo "Building hexo: $version..."
    docker build --tag "docker-hexo/hexo:$version" --no-cache=true .
    echo "Tagging hexo: $version..."
    docker tag docker-hexo $server/blog/hexo:$version
    echo "Pushing hexo: $version..."
    echo "Done."
fi
echo "Building hexo: latest..."
docker build --tag docker-hexo/hexo:latest --no-cache=true .
echo "Tagging hexo: latest..."
docker tag docker-hexo $server/blog/hexo:latest
echo "Done."