FROM qnib/fedora:22

RUN dnf install -y \
        binutils \
        bsdtar \
        bzip2 \
        curl \
        findutils \
        flex \
        git-core \
        make \
        openssl \
        perl \
        python \
        subversion \
        unzip 
RUN curl -sLf https://github.com/xedp3x/openwrt/archive/mptcp.zip | bsdtar xf - -C /opt/
RUN dnf install -y \
        gcc \
        gcc-c++ \
        file \
        ncurses-devel \
        which \
        zlib-devel 
RUN cd /opt/openwrt-mptcp/ && \
    chmod +x ./scripts/* && sleep 2 && \
    ./scripts/feeds update -a && \
    ./scripts/feeds install -a
