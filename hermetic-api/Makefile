API_IMAGE_NAME=rabbitbird/hermetic-api
VERSION=1.0

build:
	docker image build -t $(API_IMAGE_NAME):$(VERSION) ./hermetic-api

run: build
	docker container run --rm -v "$(CURDIR)/hermetic-api/data":/var/www/api/v1 -p 8080:80 $(API_IMAGE_NAME):$(VERSION)
