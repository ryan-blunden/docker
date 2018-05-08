#########
#  API  #
#########

API_IMAGE_NAME=rabbitbird/hermetic-api
VERSION=1.0

api-build:
	docker image build -t $(API_IMAGE_NAME):$(VERSION) ./hermetic-api

api-run:
	docker container run --rm -v "$(CURDIR)/hermetic-api/data":/var/www/api/v1 -p 8080:80 $(API_IMAGE_NAME):$(VERSION)

docker-for-mac-vm-exec:
	docker container run --rm -it --privileged --pid=host debian:stretch-slim nsenter -t 1 -m -u -n -i $(CMD)

shell:
	$(MAKE) docker-for-mac-vm-exec CMD="sh"
