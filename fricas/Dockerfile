# **************************************************************************
# Purpose ...: Compilation of FriCAS (official SF version) 
# Build .... : docker build -t fricas:latest .
# Test ..... : docker run -t -i fricas:latest fricas -nox
# Version .. : 02-FEB-2019
# OS ....... : ubuntu:latest 
# **************************************************************************

FROM ubuntu:latest

LABEL fricas-devel <fricas-devel@googlegroups.com>

# ENV DEBIAN_FRONTEND noninteractive
# discouraged: see https://docs.docker.com/engine/faq/

ENV FRICAS_SF https://sourceforge.net/projects/fricas/files/fricas
ENV FRICAS_VERSION 1.3.5

# ======================================
# Get packages and install missing tools
# ======================================

RUN apt-get update && apt-get install -y -q \
    build-essential \
    make \
    gcc \
    sbcl \
    cl-quicklisp \
    cl-asdf \
    zlib1g-dev \
    git \
    libcurl4-openssl-dev \
    wget \
    libx11-dev \
    libxt-dev \ 
    libice-dev \
    libsm-dev \ 
    libxau-dev \ 
    libxdmcp-dev \ 
    libxpm-dev \
    dvipng \ 
    auctex \
    net-tools \
    inetutils-ping
  

# =============================
# FriCAS (may take some time ;)
# =============================

RUN cd /root && \
    wget $FRICAS_SF/$FRICAS_VERSION/fricas-$FRICAS_VERSION-full.tar.bz2 && \
    tar xvf fricas-$FRICAS_VERSION-full.tar.bz2 && \
    cd fricas-$FRICAS_VERSION && ./configure --with-lisp=sbcl --with-x && \
    make && make install && \
    cd /root && rm -r fricas-$FRICAS_VERSION



 
