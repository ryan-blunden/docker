build:
	cd hermetic-api && $(MAKE) build
	cd mkdocs && $(MAKE) docker-build

docker-for-mac-vm-exec:
	docker container run --rm -it --privileged --pid=host debian:stretch-slim nsenter -t 1 -m -u -n -i $(CMD)

shell:
	$(MAKE) docker-for-mac-vm-exec CMD="sh"
