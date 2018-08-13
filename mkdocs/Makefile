IMAGE_NAME=rabbitbird/mkdocs
PORT=8000
VERSION=1.0

docker-build:
	docker image build -t $(IMAGE_NAME):$(VERSION) -t $(IMAGE_NAME):latest .

server:
	docker container run --rm -v "$(CURDIR)":/usr/src/app -p $(PORT):$(PORT) $(IMAGE_NAME):$(VERSION)

debug:
	docker container run --rm -p $(PORT):$(PORT) -it $(IMAGE_NAME):$(VERSION) sh

build: docker-build
	docker container run --rm -v "$(CURDIR)":/usr/src/app $(IMAGE_NAME):$(VERSION) mkdocs build --clean --strict

check:
	cd ../ && "$(MAKE)" dockerfile-check DOCKERFILE="mkdocs/Dockerfile"
