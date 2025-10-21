# ----------------------------------------------------------------------------------------
# Uitsmijter Swift Buildbox
# ----------------------------------------------------------------------------------------
ARG BASEIMAGE=swift:6.2.0-noble

FROM ${BASEIMAGE} as build
ARG VERSION=0.0.0
LABEL maintainer="aus der Technik"
LABEL Description="Swift Buildbox For Uitsmijter"

# Install OS updates and packages needed for Uitsmijter
ENV DEBIAN_FRONTEND=noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN=true
RUN apt update -q \
    && apt dist-upgrade -q -y \
    && apt install -y apt-utils apt-transport-https \
    && apt install -y \
       zlib1g-dev \
       curl libcurl4-openssl-dev wget \
       gnupg openssh-client \
       git jq \
       openjdk-17-jre \
       libjavascriptcoregtk-4.1-dev \
       sqlite3 \
    && apt-get autoremove \
    && apt clean \
    && rm -rf /var/lib/apt/lists/*; rm -rf /var/cache/apt/*

# libjavascriptcoregtk compapilitiy layer
RUN ln -sf /usr/include/webkitgtk-4.1 /usr/include/webkitgtk-4.0
RUN ln -sf /usr/lib/aarch64-linux-gnu/libjavascriptcoregtk-4.1.so /usr/lib/aarch64-linux-gnu/libjavascriptcoregtk-4.0.so 2>/dev/null || true
RUN ln -sf /usr/lib/x86_64-linux-gnu/libjavascriptcoregtk-4.1.so /usr/lib/x86_64-linux-gnu/libjavascriptcoregtk-4.0.so 2>/dev/null || true

ADD src/entrypoint-build.sh /entrypoint.sh
RUN sed -i "s/<VERSION>/${VERSION}/g" /entrypoint.sh

# Set up a build area
WORKDIR /build

ENTRYPOINT ["/entrypoint.sh"]
