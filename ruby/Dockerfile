FROM ruby:2.1
MAINTAINER ruby

RUN mkdir -p /usr/src/app

ENV RUBY_DIR /usr/src/app

COPY scripts /usr/src/app

ENV RAILS_VERSION 3.2.17

RUN bash $RUBY_DIR/build.sh