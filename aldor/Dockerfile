# **************************************************************************
# Purpose ...: Aldor + FriCAS (https://github.com/pippijn/aldor) 
# Build .... : docker build -t aldor:latest .
# Test ..... : docker run -t -i aldor:latest aldor -G loop (#quit quits)
# Version .. : 02-FEB-2019
# OS ....... : ubuntu:latest 
# **************************************************************************

FROM ubuntu:latest

LABEL fricas-devel <fricas-devel@googlegroups.com>

ENV DEBIAN_FRONTEND noninteractive
# discouraged: see https://docs.docker.com/engine/faq/

ENV ALDOR_GITHUB https://github.com/pippijn/aldor.git
ENV FRICAS_SF https://sourceforge.net/projects/fricas/files/fricas
ENV FRICAS_VERSION 1.3.4

# ======================================
# Get packages and install missing tools
# ======================================

RUN apt-get update && apt-get install -y -q \
   dialog \ 
   wget \
   git \
   make \ 
   build-essential \
   gcc \
   zlib1g-dev \
   gnupg \
   subversion \
   libtool \
   autoconf \
   automake \
   bison \
   flex \
   libx11-dev \
   libxt-dev \
   libice-dev \
   libsm-dev \ 
   libxau-dev \
   libxdmcp-dev \
   libxpm-dev \
   texlive-latex-base \
   dvipng \
   libgmp-dev \
   xfonts-100dpi \
   xfonts-75dpi \
   default-jdk \
   joe \
   most \
   python \
   python-pip \
   lynx \
   w3m \
   units \ 
   asymptote \
   gv \ 
   rlwrap \
   xterm \
   sbcl \
   cl-quicklisp \ 
   cl-asdf \
   libcurl4-openssl-dev \
   net-tools \
   inetutils-ping 

# ==============
# Aldor (Github)
# ==============

RUN cd /root && \
    git clone $ALDOR_GITHUB && \
    cd aldor/aldor && \
    ./autogen.sh && \
    ./configure && \
    make && make install


# =============================
# FriCAS (may take some time ;)
# =============================

RUN cd /root && \
    wget $FRICAS_SF/$FRICAS_VERSION/fricas-$FRICAS_VERSION-full.tar.bz2 && \
    tar xvf fricas-$FRICAS_VERSION-full.tar.bz2 && \
    cd fricas-$FRICAS_VERSION && \
    ./configure --with-lisp=sbcl --enable-aldor --enable-gmp && \
    make && make install








 
