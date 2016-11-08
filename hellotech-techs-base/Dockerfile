FROM hellotech/htmeteord:node-yarn

ENV NODE_DIR /usr/src/app
ENV SKIP_DLL true

COPY scripts /usr/src/app

WORKDIR /usr/src/app/

RUN yarn install

