FROM nginx:1.13-alpine

LABEL maintainer="Ryan Blunden <ryan.blunden@rabbitbird.com>"

WORKDIR /var/www/

HEALTHCHECK CMD curl --fail http://localhost/api/v1/health-check/ || exit 1

RUN apk update && \
    apk upgrade && \
    apk add curl

RUN rm /etc/nginx/conf.d/default.conf

RUN mkdir -p /var/www/api/v1
COPY ./data /var/www/api/v1
COPY ./conf/api.conf /etc/nginx/conf.d/

EXPOSE 443
