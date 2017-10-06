# docker-hexo

[![Build Status](https://travis-ci.org/RichardChmielek/docker-hexo.svg?branch=master)](https://travis-ci.org/RichardChmielek/docker-hexo)

## build

````docker
docker build --rm -f dockerfile -t docker-hexo\hexo:latest .
````

## run

````docker
docker run -e HEXO_ORIGIN='YOUR_REPOSITORY_ORIGIN_URL' -d -p 4000:4000 --name docker-hexo docker-hexo\hexo 
````
