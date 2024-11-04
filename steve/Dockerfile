ARG BUILD_FROM=ghcr.io/erik73/base/amd64:3.0.28
# hadolint ignore=DL3006
FROM ${BUILD_FROM}

# Set shell
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

ARG STEVE_VERSION="3.7.1"

# Setup base
RUN apk add --no-cache \
    openjdk17=17.0.13_p11-r0 \
    maven=3.9.6-r0 \
    xmlstarlet=1.6.1-r2 \
    mariadb-client=10.11.10-r0 \
    nginx=1.26.2-r0 \
    && apk add --no-cache --virtual .build-dependencies \
    git=2.45.2-r0 \
    && mkdir -p /usr/src/ \
    && cd /usr/src/ \
    && git clone -b steve-${STEVE_VERSION} --depth 1 https://github.com/steve-community/steve \
    && apk del .build-dependencies 
# Copy data for add-on
COPY rootfs /

# Build arguments
ARG BUILD_ARCH
ARG BUILD_DATE
ARG BUILD_DESCRIPTION
ARG BUILD_NAME
ARG BUILD_REF
ARG BUILD_REPOSITORY
ARG BUILD_VERSION

# Labels
LABEL \
    io.hass.name="${BUILD_NAME}" \
    io.hass.description="${BUILD_DESCRIPTION}" \
    io.hass.arch="${BUILD_ARCH}" \
    io.hass.type="addon" \
    io.hass.version=${BUILD_VERSION} \
    maintainer="Erik Hilton <erikhilton73@gmail.com>" \
    org.opencontainers.image.title="${BUILD_NAME}" \
    org.opencontainers.image.description="${BUILD_DESCRIPTION}" \
    org.opencontainers.image.vendor="Erik73 Hassio-Addons" \
    org.opencontainers.image.authors="Erik Hilton <erikhilton73@gmail.com>" \
    org.opencontainers.image.licenses="MIT" \
    org.opencontainers.image.url="https://github.com/erik73" \
    org.opencontainers.image.source="https://github.com/${BUILD_REPOSITORY}" \
    org.opencontainers.image.documentation="https://github.com/${BUILD_REPOSITORY}/blob/main/README.md" \
    org.opencontainers.image.created=${BUILD_DATE} \
    org.opencontainers.image.revision=${BUILD_REF} \
    org.opencontainers.image.version=${BUILD_VERSION}
