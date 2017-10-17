#!/bin/bash
docker login $server --username $username --password $password
if [ ! -z "$version" ]; then
    docker push $server/blog/hexo:$version
    echo "pushed $version."
fi
docker push $server/blog/hexo:latest
echo "tagged and pushed latest."
