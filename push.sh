#!/bin/bash
docker login $server --username $username --password $password
if [ ! -z "$version" ]; then
    echo "Version is set to: $version."
    echo "tagging $version..."
    docker tag docker-hexo $server/blog/hexo:$version
    echo "pushing $version..."
    docker push $server/blog/hexo:$version
    echo "tagged and pushed $version."
fi
echo "tagging latest..."
docker tag docker-hexo $server/blog/hexo:latest
echo "pushing latest..."
docker push $server/blog/hexo:latest
echo "tagged and pushed latest."
