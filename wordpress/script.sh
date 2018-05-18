#!/usr/bin/env bash
if [[ "bc4144461019" != "" ]]; then \
        docker container start rabbitbird-wordpress-db; \
else \
        docker container run \
                --name rabbitbird-wordpress-db \
                --detach \
                --env-file mysql.env \
                --network wordpress \
                --network-alias db \
                --hostname db \
                --restart on-failure \
                mysql:5.7 \
fi
