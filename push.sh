#!/bin/bash
docker login $server --username $username --password $password
if [ ! -z "$version" ]; then
    echo "Tagging hexo: $version..."
    docker tag hexo $server/blog/hexo:$version
    echo "Pushing hexo: $version..."
    docker push $server/blog/hexo:$version
    echo "Pushed $version."
fi
echo "Tagging hexo: latest..."
docker tag hexo $server/blog/hexo:latest
echo "Pusing latest..."
docker push $server/blog/hexo:latest
echo "Tagged and pushed latest."
