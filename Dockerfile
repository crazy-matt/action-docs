ARG NODE_VERSION=lts
FROM node:${NODE_VERSION}-alpine

ARG AUTHOR
ARG DOCKER_IMAGE_LATEST_VERSION
ARG DOCKER_TAG
ARG GIT_REPO_HTTP_URL
ARG GIT_SHORT_SHA

RUN set -x && \
    npm install -g "action-docs@${DOCKER_TAG}" && \
    npm cache clean --force

# OCI standard labels
LABEL org.opencontainers.image.title="Dockerized action-docs" \
    org.opencontainers.image.description="Generates and updates documentation for GitHub actions" \
    org.opencontainers.image.licenses="MIT" \
    org.opencontainers.image.documentation="${GIT_REPO_HTTP_URL}/blob/main/README.md" \
    org.opencontainers.image.source="${GIT_REPO_HTTP_URL}" \
    org.opencontainers.image.url="${GIT_REPO_HTTP_URL}.git" \
    org.opencontainers.image.authors="${AUTHOR}" \
    org.opencontainers.image.vendor="${AUTHOR}" \
    org.opencontainers.image.revision="${GIT_SHORT_SHA}" \
    org.opencontainers.image.version="${DOCKER_TAG}" \
    org.opencontainers.image.cmd="docker run --rm -v \$PWD:/work ${DOCKER_IMAGE_LATEST_VERSION} <action-docs command>"

WORKDIR /work

ENTRYPOINT ["/usr/local/bin/action-docs"]
