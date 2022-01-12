# SPDX-License-Identifier: Apache-2.0
ARG BASE_IMAGE=alpine
ARG BASE_IMAGE_TAG=latest

FROM $BASE_IMAGE:$BASE_IMAGE_TAG AS builder

ARG NODEJS_VERSION=latest
ARG AUTHOR="crazy-matt"
ARG BUILD_DATE
ARG DOCKER_TAG
ARG GIT_REPO
ARG GIT_REPO_HTTP_URL
ARG GIT_SHORT_SHA

RUN set -x && \
    if [ "${NODEJS_VERSION}" != "latest" ]; then \
        apk --no-cache add nodejs=${NODEJS_VERSION} npm=${NODEJS_VERSION}; \
    else \
        apk --no-cache add nodejs npm; \
    fi && \
    npm install -g action-docs@${DOCKER_TAG} && \
    npm cache clean --force && \
    apk del npm

# OCI standard labels
LABEL org.opencontainers.image.title="Dockerized action-docs" \
    org.opencontainers.image.description="Generates and updates documentation for GitHub actions, based on the action definition .yml." \
    org.opencontainers.image.licenses="Apache-2.0" \
    org.opencontainers.image.documentation="${GIT_REPO_HTTP_URL}/blob/main/README.md" \
    org.opencontainers.image.source="${GIT_REPO_HTTP_URL}" \
    org.opencontainers.image.url="${GIT_REPO_HTTP_URL}.git" \
    org.opencontainers.image.authors="${AUTHOR}" \
    org.opencontainers.image.vendor="${AUTHOR}" \
    org.opencontainers.image.created="${BUILD_DATE}" \
    org.opencontainers.image.revision="${GIT_SHORT_SHA}" \
    org.opencontainers.image.version="${DOCKER_TAG}" \
    org.opencontainers.image.cmd="docker run -it --rm -v \$PWD:/work ghcr.io/${GIT_REPO}:${DOCKER_TAG} <action-docs command>"

WORKDIR /work
ENTRYPOINT ["/usr/local/bin/action-docs"]
CMD [""]
