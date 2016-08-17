FROM ubuntu:14.04

MAINTAINER Jeff LaPlante <jeff@jefflaplante.com>

RUN apt-get -y update && apt-get -y install --no-install-recommends \
    ca-certificates \
    wget \
    git \
    build-essential \
    zlib1g-dev \
    libssl-dev \
    libreadline6-dev \
    libyaml-dev \
    libxslt-dev \
    libxml2-dev \
    libyaml-dev \
    ruby1.9.1 \
    ruby1.9.1-dev \
    && gem update && gem install fpm --no-ri --no-rdoc \
    && rm -rf /var/lib/apt/lists/*

COPY docker_build_ruby.sh /tmp/build.sh

ENV RUBY_VER=2.3.1
ENV ITERATOR=1
ENV PKG_NAME="di-ruby"
ENV MAINTAINER="jeff@jefflaplante.com"

CMD ["/tmp/build.sh"]

