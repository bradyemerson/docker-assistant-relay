FROM node:12-alpine
LABEL maintainer "Brady Emerson <bradye@gmail.com>"

RUN mkdir /opt/assistant-relay &&\
	wget https://github.com/greghesp/assistant-relay/releases/download/v3.1.3/release.zip && \
	unzip release.zip -d /opt/assistant-relay && \
	rm release.zip && \
	cd /opt/assistant-relay && \
	npm install

RUN mkdir /config &&\
	sed -i -e 's;./bin/config.json;/config/config.json;' /opt/assistant-relay/bin/www

VOLUME /config
EXPOSE 3000

WORKDIR /opt/assistant-relay
CMD npm run start