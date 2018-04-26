#
# `ARG` is the only directive allowed before the `FROM` directive.
#
# This is used to dynamically change the tag for this python image. Use with caution.
ARG PYTHON_VERSION=3.6
FROM python:${PYTHON_VERSION}-alpine

# This is a build arg that could be overwritten, but is unlikely to be.
ARG WWW_ROOT=/usr/src/app

#
# These are build args that we expect from our CI system.
#
ARG GIT_SHA
ARG JOB_NUMBER
ARG VERSION

#
# The above args are only available during the imag build process.
#
# If we want them available at container runtime, we need to expose them as environment (ENV) variables.
#
# NOTE: Doing this also has the benefit of busting the cache as ENV statements are recorded in the build and so, changing
# their value results in the cache invalidation of the image at this point. 
#
# Change the values in the Makefile that are sent to the `build` target if you want to see this behaviour in action.
#
ENV GIT_SHA=${GIT_SHA}
ENV JOB_NUMBER=${JOB_NUMBER}
ENV VERSION=${VERSION}

#
# This is another way to expose the build arguments to the application by way of a `.properties` file.
#
RUN printf "GIT_SHA=${GIT_SHA}\nJOB_NUMBE${JOB_NUMBER}\nVERSION=${VERSION}\n" > .properties

#
# You can use the `LABEL` directive to provide metadata about the application.
LABEL MAINTAINER="Ryan Blunden <ryan.blunden@rabbitbird.com>"
LABEL NAME="Python Static Server"
LABEL VERSION="${VERSION}"

WORKDIR ${WWW_ROOT}

RUN apk upgrade --no-cache

COPY www ${WWW_ROOT}

#
# The health check *must* return 0 or 1 so either make sure it does, or you can use the ` || exit 1` trick.
HEALTHCHECK --interval=5s --timeout=5s --retries=3 CMD wget localhost:8080/healthz -q -O - > /dev/null 2>&1

EXPOSE 8080

#
# The `-u` flag forces Python to flush its buffer whenever it receives input.
#
CMD ["python", "-u", "-m", "http.server", "8080"]
