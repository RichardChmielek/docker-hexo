#!/bin/bash
docker login --username $username --password $password $server
if [ ! -z "$version" ]; then
    echo "Version is set. tagging and pushing new version"
    docker tag docker-hexo $server/$username/hexo:$version
    docker push $server/$username/hexo:$version
fi

docker tag docker-hexo $server/$username/hexo:latest
docker push $server/$username/hexo:latest
