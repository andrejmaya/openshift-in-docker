FROM docker:dind

MAINTAINER Andrej Maya

ENV OC_VERSION=v1.5.1 \
    OC_HASH=7b451fc \
    GLIBC_VERSION=2.22-r8


## Install glibc
RUN apk update && apk add curl ca-certificates && \
    curl -O -L https://github.com/andyshinn/alpine-pkg-glibc/releases/download/${GLIBC_VERSION}/glibc-${GLIBC_VERSION}.apk -o glibc-${GLIBC_VERSION}.apk && \
    apk --allow-untrusted add glibc-${GLIBC_VERSION}.apk && \
    rm -f glibc-${GLIBC_VERSION}.apk && \
    rm -rf /root/.cache && \
    rm -rf /var/cache/apk/ && \
    apk version glibc && \
    ls /lib64/

## Install oc cli
RUN curl -L https://github.com/openshift/origin/releases/download/${OC_VERSION}/openshift-origin-client-tools-${OC_VERSION}-${OC_HASH}-linux-64bit.tar.gz \
      | tar xz && install /openshift-origin-client-tools-${OC_VERSION}-${OC_HASH}-linux-64bit/oc /usr/bin/oc && rm -rf openshift*

CMD ["--insecure-registry", "172.30.0.0/16"]
