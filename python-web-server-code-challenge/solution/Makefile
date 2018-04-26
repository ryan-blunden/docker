#
# Variables are great and particularly great in Makefiles.
#
# They can be used for default values (e.g. `PYTHON_VERSION`) as well as vars that must be supplied such as
# `JOB_NUMBER` and `GIT_SHA` that we would rely on on being supplied as environment variables from our
# build system.
PORT=8080
WWW_ROOT=/usr/src/app
IMAGE=rabbitbird/webserver
VERSION=latest
PYTHON_VERSION=3.6.5

#
# Run this or the `jenkins-build` target before running the container.
#
# There is no real reason (in this project) why the Dockerfile exists in a lower 
# level directory. This *is* done when you have a project that needs multiple Dockerfile's 
# and you can use the `-f` argument to indicate where the Dockerfile is.
#
# Note that you can also change the default location of the build context but this is usually 
# the directory that you are running in.
#
# usage: `make build VERSION=1.0`
build:
	
	docker image build $(BUILD_ARGS) -t $(IMAGE):$(VERSION) -f docker/webserver/Dockerfile .

# Emulate the passing in build arguments to the `build` target, like would be done in Jenkins or other CI system.
# This has the often desired effect of forcing the image to re-build and ignored cached layers like the upgrading
# and installing of system packages.
#
# usage: `make jenkins-build JOB_NUMBER=156 GIT_SHA=4j9nq24 VERSION=1.0`
jenkins-build:
	$(MAKE) build \BUILD_ARGS="\
		--build-arg PYTHON_VERSION=$(PYTHON_VERSION) \
		--build-arg JOB_NUMBER=$(JOB_NUMBER) \
		--build-arg GIT_SHA=$(GIT_SHA) \
		--build-arg VERSION=$(VERSION)"

#
# The `CMD` variables means the default command from the Dockerfile can be overriden.
#
# usage: `make run CMD=bash`
run:
	docker container run --rm -p $(PORT):$(PORT) $(IMAGE):$(VERSION) $(CMD)

#
# It's always handy to have a development version of the run command that will volume mount
# in your souce code so you can instantly see changes without having to re-build and restart
# your container.
run-dev:
	docker container run --rm -it \
	-v "$(CURDIR)/www":$(WWW_ROOT) \
	-p $(PORT):$(PORT) $(IMAGE):$(VERSION) $(CMD)

check:
	docker container run -it --rm --privileged \
	-v "$(CURDIR)":/root/ projectatomic/dockerfile-lint \
	dockerfile_lint -f docker/webserver/Dockerfile
