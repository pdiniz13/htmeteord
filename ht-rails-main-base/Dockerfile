FROM hellotech/htmeteord:node-yarn-ruby
MAINTAINER hellotech

RUN mkdir -p /usr/src/app

ENV RUBY_DIR /usr/src/app

COPY scripts /usr/src/app

RUN bash $RUBY_DIR/build.sh