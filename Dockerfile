FROM ubuntu:17.10
MAINTAINER Naomi Peori <naomi@peori.ca>

ENV PS4DEV=/usr/local/ps4dev
ENV PS4SDK=$PS4DEV/ps4sdk

RUN \
  apt-get -y update && \
  apt-get -y install build-essential clang curl git && \
  apt-get -y clean autoclean autoremove && \
  rm -rf /var/lib/{apt,dpkg,cache,log}/ && \
  curl -sL https://deb.nodesource.com/setup_9.x | bash - && \
  apt-get install -y nodejs

RUN \
  mkdir -p ${PS4DEV} && \
  cd ${PS4DEV} && \
  git clone https://github.com/ps4dev/ps4sdk && \
  cd ps4sdk && \
    make -j

RUN \
  cd ${PS4DEV} && \
  git clone https://github.com/ps4dev/elf-loader && \
  cd elf-loader && \
    make -j

WORKDIR /build

CMD node ${PS4DEV}/elf-loader/local/server.js
