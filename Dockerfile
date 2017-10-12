FROM node:8.7.0

EXPOSE 8089

ENV NEWMAN_VERSION 3.8.1

RUN node --version && npm install -g newman@${NEWMAN_VERSION}

ADD . /newman

WORKDIR /newman

RUN chmod +x /newman/start.sh

CMD /newman/start.sh