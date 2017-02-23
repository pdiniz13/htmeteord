FROM node:6.9.1
MAINTAINER hellotech

RUN mkdir -p /usr/src/app

ENV NODE_DIR /usr/src/app

COPY scripts /usr/src/app

RUN bash $NODE_DIR/build.sh