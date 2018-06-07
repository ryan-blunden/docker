# Python Web Server Docker Code Challenge

The challenge is to create a Dockerfile and is a Python (or other, if you want a harder challenge) static web server. You'll 
also create a Makefile for easy management.

It is designed to test your knowledge of the most fundamental Dockerfile
directives, as well as ensuring you are carefully thinking through all of the design decisions such as
the order of operations and what Docker image you extend from.

## The Dockerfile

- Create a Dockerfile that runs a Python 3 static web server using the command `python -m http.server 8080`. You can also experiment with other front-end servers such as NGINX or Caddy if you want a harder challenge.
- There should be a `www` directory that contains the contents of the static site.
- The contents of the `www` directory should be copied into `/usr/src/app` inside the image which also should be the working directory.
- The Dockerfile should have a `HEALTHCHECK` with the health-check URL at /healthz that should return `{ "status": "ok" }`.

## The Makefile

- Create a Makefile that has:
  - One command for building the Docker image.
  - One command for running the image.
  - One command for running the image in dev mode where it volume mounts the `www` from the host directory to `/usr/src/app`.

Bonus points for integrating Project Atomic's Dockerfile linter - https://github.com/projectatomic/dockerfile_lint.  

## If you're stuck

That's ok! Look in the solution folder but be sure not to copy and paste, but to manually type all the code, ensuring that you understand what you're typing as you go.
