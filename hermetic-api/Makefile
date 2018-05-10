API_IMAGE_NAME=rabbitbird/hermetic-api
VERSION=1.0

build:
	docker image build -t $(API_IMAGE_NAME):$(VERSION) .

run: build
	docker container run --rm -v "$(CURDIR)/data":/var/www/api/v1 -p 8080:80 $(API_IMAGE_NAME):$(VERSION)
