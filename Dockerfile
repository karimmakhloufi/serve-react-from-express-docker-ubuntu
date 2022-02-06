FROM ubuntu

RUN DEBIAN_FRONTEND=noninteractive apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y curl node-gyp

RUN curl -fsSL https://deb.nodesource.com/setup_lts.x | bash -
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y nodejs
RUN npm install -g pm2

WORKDIR /app

COPY /src/backend ./backend

WORKDIR /app/backend

RUN npm install

COPY /src/front/public /app/front/public

COPY /src/front/src /app/front/src

COPY /src/front/package.json /app/front/package.json

WORKDIR /app/front

RUN npm install

RUN npm run build

CMD pm2-runtime start /app/backend/index.js