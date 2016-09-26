FROM ruby:2.3
MAINTAINER ruby

RUN mkdir -p /usr/src/app

ENV RUBY_DIR /usr/src/app

COPY scripts /usr/src/app

ENV RAILS_VERSION 5.0.0.1

RUN bash $RUBY_DIR/build.sh