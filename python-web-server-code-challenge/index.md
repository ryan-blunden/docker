# Python static server Docker code challenge

The challenge is to create a simple static web server using Python. You will also create a Makefile for easy task running. 

## The Makefile

There are plenty of examples in this repository which show how to write a Makefile, including variables. Just remember that Make relies on tabs (not spaces) for indentation.

## Purpose of this lab

This lab is designed to test your knowledge of the most fundamental Dockerfile
directives, as well as ensuring you are carefully thinking through all of the design decisions such as the order of operations and what Docker image you extend from.

## Challenge 1: The Dockerfile

- Create a Dockerfile that runs a Python 3 static web server using the command `python -m http.server 8080`. You can try using other front-end servers such as NGINX if you like.
- There should be a `www` directory that contains the contents of the static site.
- The contents of the `www` directory should be copied into `/usr/src/app` inside the image which also should be the working directory.
- The Dockerfile should have a `HEALTHCHECK` with the health-check URL at /healthz that should return `{ "status": "ok" }`.

## Challenge 2: The Makefile

Make it easy for yourself and your team mates to run repetitive commands using Make.

- Create a Makefile that has:
  - One command for building the Docker image.
  - One command for running the image.
  - One command for running the image in dev mode where it volume mounts the `www` from the host directory to `/usr/src/app`.

## Challenge 3: Dockerfile linter

Bonus points for integrating the [Hadolint](https://github.com/hadolint/hadolint) Dockerfile linter.
