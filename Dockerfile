FROM quay.io/coreos/hyperkube:v1.9.6_coreos.0

RUN set -ex && \
    apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install --yes --no-install-recommends apt-transport-https apt-utils ca-certificates pkg-config gnupg1 && \
    \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 08B73419AC32B4E966C1A330E84AC2C0460F3994 && \
    echo "deb https://download.ceph.com/debian-jewel/ jessie main" > /etc/apt/sources.list.d/ceph.list && \
    \
    apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get dist-upgrade --yes && \
    \
    apt-get clean && \
    rm -rf tmp/*
