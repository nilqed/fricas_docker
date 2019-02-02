# **************************************************************************
# Purpose ...: Compilation of FriCAS V 1.3.1, then building a "deb" package
# Build .... : docker build -t fricas:1.3.1 .
# Test ..... : docker run -t -i fricas:1.3.1 [/bin/bash| fricas -nox]
# Version .. : 09-MAR-2017
# OS ....... : ubuntu:latest 
# **************************************************************************

FROM ubuntu:latest

LABEL fricas-devel <fricas-devel@googlegroups.com>

# ENV DEBIAN_FRONTEND noninteractive
# discouraged: see https://docs.docker.com/engine/faq/

ENV SBCL_VERSION 1.3.15
ENV SBCL_SF https://sourceforge.net/projects/sbcl/files/sbcl/$SBCL_VERSION
ENV SBCL_HOME /usr/local/lib/sbcl
ENV FRICAS_SF https://sourceforge.net/projects/fricas/files/fricas
ENV FRICAS_VERSION 1.3.1

# ======================================
# Get packages and install missing tools
# ======================================

RUN apt-get update && apt-get install -y -q \
    build-essential \
    make \
    gcc \
    zlib1g-dev \
    git \
    libcurl4-openssl-dev \
    subversion  \
    wget \
    gnupg \
    libx11-dev \
    libxt-dev \ 
    libice-dev \
    libsm-dev \ 
    libxau-dev \ 
    libxdmcp-dev \ 
    libxpm-dev \
    dvipng \ 
    auctex \
    ruby \
    ruby-dev \
    gem

 
# ====  
# SBCL
# ====

RUN cd /root && \
    wget $SBCL_SF/sbcl-$SBCL_VERSION-x86-64-linux-binary.tar.bz2 && \
    tar xvf sbcl-$SBCL_VERSION-x86-64-linux-binary.tar.bz2 

RUN cd /root/sbcl-$SBCL_VERSION-x86-64-linux && sh install.sh && \
    cd /root && rm -r sbcl-$SBCL_VERSION-x86-64-linux && \
    rm sbcl-$SBCL_VERSION-x86-64-linux-binary.tar.bz2


# =============================
# FriCAS (may take some time ;)
# =============================

RUN cd /root && \
    wget $FRICAS_SF/$FRICAS_VERSION/fricas-$FRICAS_VERSION-full.tar.bz2 && \
    tar xvf fricas-$FRICAS_VERSION-full.tar.bz2 && \
    cd fricas-$FRICAS_VERSION && ./configure && make && make install && \
    cd /root && rm -r fricas-$FRICAS_VERSION


# =======================
# FPM + Build deb package
# =======================

RUN cd /root && gem install fpm

RUN cd /root && \
    fpm --verbose -s dir -t deb -n fricas -v $FRICAS_VERSION --license BSD \
    --category "CAS" --provides "binaries" \
    --maintainer "fricas-devel <fricas-devel@googlegroups.com>" \
    --description "https://en.wikipedia.org/wiki/FriCAS" \
    --url "http://fricas.sourceforge.net/" \
    /usr/local/bin/fricas /usr/local/lib/fricas/
    
 
