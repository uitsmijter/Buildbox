# ----------------------------------------------------------------------------------------
# Kubernetes kubectl
# ----------------------------------------------------------------------------------------
FROM debian:bullseye AS kubectl

ENV DEBIAN_FRONTEND=noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN=true
RUN apt update -q \
    && apt dist-upgrade -q -y \
    && apt install -y apt-utils apt-transport-https
RUN apt install -y \
    curl

ENV ARCH=$(arch)
WORKDIR /bin
RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/${ARCH}/kubectl"



# ----------------------------------------------------------------------------------------
# E2E TEST RUNTIME
# ----------------------------------------------------------------------------------------
FROM node:20-bullseye

LABEL maintainer="aus der Technik"
LABEL Description="Uitsmijter e2e"

ENV DEBIAN_FRONTEND=noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN=true
RUN apt update -q \
    && apt dist-upgrade -q -y \
    && apt install -y apt-utils apt-transport-https
RUN apt install -y \
    yamllint

# Kubernetes & Helm
COPY --from=kubectl /bin/kubectl /usr/bin/kubectl
RUN curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash

WORKDIR /tests
#ADD src/package.json .

# Tests have to modify root data
USER root

# Install dependencies
 RUN yarn global add playwright@1.42.1; \
     yarn global add @playwright/test@1.42.1; \
    npx playwright install-deps; \
    npx playwright install

ADD src/entrypoint-test.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
CMD [ "bash" ]
