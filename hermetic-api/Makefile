IMAGE_NAME=rabbitbird/hermetic-api
VERSION=1.0

build:
	docker image build -t $(IMAGE_NAME):$(VERSION) -t $(IMAGE_NAME):latest .

run: build
	docker container run --rm -v "$(CURDIR)/data":/var/www/api/v1 -p 8080:80 $(IMAGE_NAME):$(VERSION)

check:
	cd ../ && "$(MAKE)" dockerfile-check DOCKERFILE="hermetic-api/Dockerfile"
