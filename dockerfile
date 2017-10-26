FROM node:6-slim

LABEL maintainer="https://github.com/RichardChmielek"

# grab gosu for easy step-down from root
ENV GOSU_VERSION 1.10
RUN set -x \
	&& wget -O /usr/local/bin/gosu "https://github.com/tianon/gosu/releases/download/$GOSU_VERSION/gosu-$(dpkg --print-architecture)" \
	&& wget -O /usr/local/bin/gosu.asc "https://github.com/tianon/gosu/releases/download/$GOSU_VERSION/gosu-$(dpkg --print-architecture).asc" \
	&& export GNUPGHOME="$(mktemp -d)" \
	&& gpg --keyserver ha.pool.sks-keyservers.net --recv-keys B42F6819007F00F88E364FD4036A9C25BF357DD4 \
	&& gpg --batch --verify /usr/local/bin/gosu.asc /usr/local/bin/gosu \
	&& rm -r "$GNUPGHOME" /usr/local/bin/gosu.asc \
	&& chmod +x /usr/local/bin/gosu \
	&& gosu nobody true

ENV NPM_CONFIG_LOGLEVEL warn
ENV NODE_ENV production

# Update image
RUN apt-get update && apt-get upgrade -y
# Install git
RUN apt-get install git-core -y
# Install hexo
RUN npm install -g hexo-cli --loglevel ${NPM_CONFIG_LOGLEVEL}
# Create blog directory
RUN mkdir -p /blog
WORKDIR /blog
# Initialize hexo
RUN hexo init
# Remove default hello-world blog post
RUN rm /blog/source/_posts/hello-world.md
COPY start.sh /blog/start.sh
RUN chmod 755 start.sh
RUN ls -l start.sh

# Expose port 4000 (default hexo)
EXPOSE 4000
# Run hexo server
ENTRYPOINT [ "sh", "/blog/start.sh" ]