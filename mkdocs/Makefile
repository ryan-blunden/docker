IMAGE_NAME=rabbitbird/mkdocs
PORT=8000
VERSION=latest

build:
	docker image build -t $(IMAGE_NAME) .

run: build
	docker container run --rm -v "$(CURDIR)":/usr/src/app -p 8080:8080 $(IMAGE_NAME):$(VERSION)
