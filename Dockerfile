FROM node:lts-alpine3.20

RUN apk add --no-cache \
      bash \
      curl \
      git \
      kitty-terminfo \      
      the_silver_searcher

EXPOSE 5000

RUN npm install -g npm@10.8.1

WORKDIR /home/node/dev
COPY . .

RUN chown -R node: /home/node
USER node

RUN cd /home/node/dev/apps/web && \
    npm install && \
    npm run build

