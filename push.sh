#!/bin/sh
while [ $# -gt 0 ]; do
  case "$1" in
    -s|--server=*)
      server="${1#*=}"
      ;;
    -u|--username=*)
      username="${1#*=}"
      ;;
    -c|--container=*)
      container="${1#*=}"
      ;;
    -v|--version=*)
      version="${1#*=}"
      ;;
    *)
      echo "********************************\n"
      echo "* Error: Unexpected parameters.*\n"
      echo "********************************\n"
      exit 1
  esac
  shift
done

docker login $server --username $username --password $password
if [ ! -z "$version" ]; then
    echo "Tagging hexo: $version..."
    docker tag hexo $server/$container:$version
    echo "Pushing hexo: $version..."
    docker push $server/$container:$version
    echo "Pushed $version."
fi
echo "Tagging hexo: latest..."
docker tag hexo $server/blog/hexo:latest
echo "Pusing latest..."
docker push $server/blog/hexo:latest
echo "Tagged and pushed latest."
