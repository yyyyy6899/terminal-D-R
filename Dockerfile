FROM ubuntu:20.04

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV GOTTY_TAG_VER v1.0.1
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=UTC

RUN apt-get update && \
    apt-get install -y \
        curl \
        wget \
        procps \
        sudo \
        htop \
        nano \
        inxi \
    curl -sLk https://github.com/yudai/gotty/releases/download/${GOTTY_TAG_VER}/gotty_linux_amd64.tar.gz \
        | tar xzC /usr/local/bin && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY /gotty.sh /gotty.sh

RUN chmod 744 /gotty.sh

EXPOSE 8080

CMD ["/bin/bash","/gotty.sh"]
