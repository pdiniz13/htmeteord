FROM hellotech/htmeteord:base
MAINTAINER HelloTech

COPY ./ /app
COPY private/ssl/* /etc/nginx/certs/
COPY private/config/vhost.d/* /etc/nginx/vhost.d/

ARG BUILD_FOR
# ARG MOBILE

RUN bash $METEORD_DIR/lib/build_app.sh

ENV HTAPP_ENV ${BUILD_FOR:staging}

ENTRYPOINT bash /app/my_run_app.sh
