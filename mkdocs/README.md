# Docker mkdocs

This image aims to make it as easy as possible to write your awesome documentation.

TL;DR - The `ENTRYPOINT` is the `mkdocs` command itself, so just use this container as if you had the mkdocs script installed on your path.

## How it works

 1. The image relies on you mounting a host directory to /usr/src/docs in the container.
 1. The entrypoint to the container is the `mkdocs` command.
 1. You can then use this is a Docker image as a commandline utility.

## Creating a new project

Create a new mkdocs project called `mydocs` in the current directory.

    docker run -it --rm -v ${PWD}:/usr/src/docs rabbitbird/mkdocs new mydocs

## Serving your site

Serving a mkdocs project is the default behaviour.

Presuming you're in your project directory, run:

    docker run -it --rm -v ${PWD}:/usr/src/docs -p 8080:8080 rabbitbird/mkdocs

You can then view your docs at ![http://localhost:8080/](http://localhost:8080/).

## If you want to serve the docs on a different port

If port 8080 is clashing with another service you're running locally, use `docker run -it --rm -v ${PWD}:/usr/src/docs -P rabbitbird/mkdocs` and then use `docker ps` to see which unprivilidged port Docker has mapped to the running image.

## Building your site

We just pass the `build --clean` command.

    docker run -it --rm -v ${PWD}:/usr/src/docs rabbitbird/mkdocs build --clean
