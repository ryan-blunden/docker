FROM alpine:3.7

LABEL maintainer='Ryan Blunden <ryan.blunden@rabbitbird.com>'

RUN apk update && \
    apk upgrade && \
    apk add --no-cache python3 && \
    pip3 install --upgrade pip setuptools && \
    rm -r /root/.cache

WORKDIR /usr/src/app

COPY requirements.txt ./
RUN pip3 install -r requirements.txt

COPY ./docs mkdocs.yml ./

EXPOSE 8080

CMD ["mkdocs", "serve", "--dev-addr=0.0.0.0:8080"]
