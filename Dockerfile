FROM node:6.9.2-alpine

LABEL name=verdaccio/verdaccio
LABEL version=2.1.0

RUN adduser -D -g "" verdaccio  \
 && mkdir /verdaccio \
 && chown -R verdaccio.verdaccio /verdaccio

USER verdaccio
WORKDIR /verdaccio
COPY package.json /verdaccio/
RUN npm install
COPY . /verdaccio

CMD ["./bin/verdaccio", "--config", "./conf/docker.yaml", "--listen", "0.0.0.0:4873"]
