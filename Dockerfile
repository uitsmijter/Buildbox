# ----------------------------------------------------------------------------------------
# Uitsmijter Swift Buildbox
# ----------------------------------------------------------------------------------------
ARG BASEIMAGE=swift:5.7.0-jammy

FROM ${BASEIMAGE} as build
LABEL maintainer="aus der Technik"
LABEL Description="Swift Buildbox For Uitsmijter"

# Install OS updates and packages needed for Uitsmijter
ENV DEBIAN_FRONTEND=noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN=true
RUN apt update -q \
    && apt dist-upgrade -q -y \
    && apt install -y apt-utils apt-transport-https \
    && apt install -y \
       libz-dev \
       curl libcurl4-openssl-dev wget \
       gnupg openssh-client \
       git jq \
       openjdk-17-jre \
       libjavascriptcoregtk-4.0-dev \
       sqlite \
    && apt-get autoremove \
    && apt clean \
    && rm -rf /var/lib/apt/lists/*; rm -rf /var/cache/apt/*

ADD entrypoint.sh /entrypoint.sh

# Set up a build area
WORKDIR /build

ENTRYPOINT ["/entrypoint.sh"]
