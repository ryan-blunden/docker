FROM python:3.7-alpine

WORKDIR /usr/src/app

COPY www ${WWW_ROOT}

#
# These are build args that we expect from our CI system.
#
ARG GIT_SHA
ARG JOB_NUMBER
ARG VERSION

#
# The above are turned into environment variables only for the life of the image build process.
#
# If we want them available at container runtime, we need to expose them as environment (ENV) variables.
#
ENV GIT_SHA=${GIT_SHA}
ENV JOB_NUMBER=${JOB_NUMBER}
ENV VERSION=${VERSION}

#
# This is another way to expose the build arguments to the application by way of a `.properties` file. This could be used in an internal healthcheck or info URL.
#
RUN printf "GIT_SHA=${GIT_SHA}\nJOB_NUMBER=${JOB_NUMBER}\nVERSION=${VERSION}\n" > .properties

#
# The health check *must* return 0 or 1 so either make sure it does, or you can use the ` || exit 1` trick.
# Kubernetes doesn't use this but defining the url of the healthcheck here means 
# we know what to use when writing our Kubernetes Pod spec.
HEALTHCHECK --interval=5s --timeout=5s --retries=3 CMD wget localhost:8080/healthz -q -O - > /dev/null 2>&1 || exit 1

# Also not used by Kubernetes but is good to document the application port
EXPOSE 8080

#
# The `-u` flag forces Python to flush its buffer whenever it receives input.
#
CMD ["python", "-u", "-m", "http.server", "8080"]
