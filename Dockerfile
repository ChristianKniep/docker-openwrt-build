FROM ubuntu:14.04

RUN apt-get update && \
    apt-get install -y \
    binutils \
    bzip2 \
    curl \
    file \
    findutils \
    flex \
    git-core \
    make \
    openssl \
    perl \
    python \
    subversion \
    unzip 
RUN apt-get install -y \
            build-essential \
            gawk \
            gcc \
            ncurses-dev \
            wget \
            zlib1g-dev 
RUN curl -sLo /opt/openwrt-mptcp.zip https://github.com/xedp3x/openwrt/archive/mptcp.zip && \
    cd /opt/ && \
    unzip /opt/openwrt-mptcp.zip && rm -f /opt/openwrt-mptcp.zip
RUN cd /opt/openwrt-mptcp/ && \
    chmod +x ./scripts/* && sleep 2 && \
    ./scripts/feeds update -a && \
    ./scripts/feeds install -a

