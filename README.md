# docker-hexo

[![Build Status](https://travis-ci.org/RichardChmielek/docker-hexo.svg?branch=master)](https://travis-ci.org/RichardChmielek/docker-hexo)

## build

````docker
docker build --rm -f dockerfile -t docker-hexo\hexo:latest .
````

## variables

````docker
$origin
````
> **$origin**: your blog's git source
````docker
$server
````
> **$server**: login server/container registry
````docker
$username
````
> **$username**: user name used to login to container registry
````docker
$password
````
> **$password**: password used to login to container registry

## run

````docker
docker run -e HEXO_ORIGIN='$origin' -d -p 4000:4000 --name docker-hexo docker-hexo\hexo 
````
