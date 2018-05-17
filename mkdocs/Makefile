IMAGE_NAME=rabbitbird/mkdocs
PORT=8000
VERSION=1.0

docker-build:
	docker image build -t $(IMAGE_NAME):$(VERSION) -t $(IMAGE_NAME):latest .

server: docker-build
	docker container run --rm -v "$(CURDIR)":/usr/src/app -p 8080:8080 $(IMAGE_NAME):$(VERSION)

build: docker-build
	docker container run --rm -v "$(CURDIR)":/usr/src/app $(IMAGE_NAME):$(VERSION) mkdocs build --clean --strict
