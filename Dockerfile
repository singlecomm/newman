FROM alpine:3.6

EXPOSE 8089

ENV NODE_VERSION 6.10.3-r1
ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8
ENV NEWMAN_VERSION 3.8.1

RUN apk add --update bash nodejs nodejs-npm;
RUN node --version
RUN npm install -g newman@${NEWMAN_VERSION};

ADD . /newman

WORKDIR /newman

RUN chmod +x start.sh

CMD start.sh