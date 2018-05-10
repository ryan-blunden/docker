IMAGE_NAME=rabbitbird/mkdocs
PORT=8000
VERSION=latest

docker-build:
	docker image build -t $(IMAGE_NAME) .

server: docker-build
	docker container run --rm -v "$(CURDIR)":/usr/src/app -p 8080:8080 $(IMAGE_NAME):$(VERSION)

build: docker-build
	docker container run --rm -v "$(CURDIR)":/usr/src/app $(IMAGE_NAME):$(VERSION) mkdocs build --clean --strict
