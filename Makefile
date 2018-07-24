build:
	cd mkdocs && "$(MAKE)" docker-build
	cd hermetic-api && "$(MAKE)" build

docker-for-mac-shell:
	docker container run --rm -it --privileged --pid=host debian:stretch-slim nsenter -t 1 -m -u -n -i sh

dockerfile-check:
	docker container run -it --rm --privileged \
	-v "$(CURDIR)":/root/ projectatomic/dockerfile-lint:latest \
	dockerfile_lint -f $(DOCKERFILE)

portainer:
	 docker container run -p 9000:9000 --rm -v /var/run/docker.sock:/var/run/docker.sock portainer/portainer:latest --no-auth
