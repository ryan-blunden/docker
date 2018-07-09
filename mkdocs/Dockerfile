FROM python:3.6-alpine

LABEL name='MkDocs'
LABEL maintainer='Ryan Blunden <ryan.blunden@rabbitbird.com>'
LABEL version='latest'

RUN apk update && \
    apk upgrade && \
    apk add --no-cache python3 && \
    pip install --upgrade pip setuptools && \
    rm -r /root/.cache

WORKDIR /usr/src/app

COPY requirements.txt ./
RUN pip install -r requirements.txt && \
    rm -r /root/.cache

COPY ./docs mkdocs.yml ./

EXPOSE 8000

CMD ["mkdocs", "serve", "--dev-addr=0.0.0.0:8000"]
