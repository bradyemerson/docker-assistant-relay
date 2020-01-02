FROM node:12-alpine
LABEL maintainer "Brady Emerson <bradye@gmail.com>"

RUN mkdir /opt/assistant-relay &&\
	wget https://github.com/greghesp/assistant-relay/releases/download/v3.1.3/release.zip && \
	unzip release.zip -d /opt/assistant-relay && \
	cd /opt/assistant-relay &&\
	npm install

VOLUME /opt/assistant-relay/server/configurations/secrets
VOLUME /opt/assistant-relay/server/configurations/tokens
EXPOSE 3000

WORKDIR /opt/assistant-relay
CMD npm run start