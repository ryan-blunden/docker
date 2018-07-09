# Wordpress without Docker Compose
#
# It ain't the prettiest, but I always think it's a good idea to know how to do things
# without a layer of abstraction when first learning a technology.
#

start: network mysql wordpress

stop:
	docker container stop $(WORDPRESS_NAME)
	docker container stop $(WORDPRESS_DB_NAME)

restart: stop start

NETWORK=wordpress

network:
	@$(eval NETWORK_ID=$(shell docker network ls -qf name=$(NETWORK)))

	@if [[ "$(NETWORK_ID)" = "" ]]; then \
		docker network create $(NETWORK); \
	fi


WORDPRESS_DB_NAME=rabbitbird-wordpress-db

mysql:
	@$(eval CONTAINER_ID=$(shell docker container ps -aqf name=^/$(WORDPRESS_DB_NAME)$$))

	@if [[ "$(CONTAINER_ID)" != "" ]]; then \
		docker container start $(WORDPRESS_DB_NAME); \
	else \
		docker container run \
			--name $(WORDPRESS_DB_NAME) \
			--detach \
			--env-file mysql.env \
			--network $(NETWORK) \
			--network-alias db \
			--hostname db \
			--restart on-failure \
			mysql:5.7; \
	fi


WORDPRESS_IMAGE=rabbitbird/wordpress
WORDPRESS_VERSION=1.0
WORDPRESS_PORT=8080

build:
	docker image pull wordpress:4.9-php7.2-apache
	docker image build -t $(WORDPRESS_IMAGE):$(WORDPRESS_VERSION) -t $(WORDPRESS_IMAGE):latest .

check:
	cd ../ && "$(MAKE)" dockerfile-check DOCKERFILE="wordpress/Dockerfile"

WORDPRESS_NAME=rabbitbird-wordpress

wordpress:
	$(eval CONTAINER_ID=$(shell docker container ps -aqf name=^/$(WORDPRESS_NAME)$$))

	@if [[ "$(CONTAINER_ID)" != "" ]]; then \
		docker container start $(WORDPRESS_NAME); \
	else \
		docker container run \
			--name $(WORDPRESS_NAME) \
			--detach \
			--network $(NETWORK) \
			--env-file wordpress.env \
			--hostname wordpress \
			--restart on-failure \
			-p $(WORDPRESS_PORT):80 \
			$(WORDPRESS_IMAGE):$(WORDPRESS_VERSION); \
	fi

destroy:
	-docker container rm --force $(WORDPRESS_NAME) $(WORDPRESS_DB_NAME)
	-docker network remove $(NETWORK)
