# **************************************************************************
# Purpose ...: Create packages 
# Build .... : docker build -t fpm:fricas .
# Test ..... : docker run -t -i fpm:fricas fpm --version
# Version .. : 03-FEB-2019
# OS ....... : ubuntu:latest 
# -- copy container -> host
#  docker cp <containerId>:/file/path/within/container /host/path/target
# **************************************************************************

FROM nilqed/fricas:latest

LABEL fpm_doc https://fpm.readthedocs.io/en/latest/index.html

ENV DEBIAN_FRONTEND noninteractive
# discouraged: see https://docs.docker.com/engine/faq/

ENV FRICAS_SF https://sourceforge.net/projects/fricas/files/fricas
ENV FRICAS_VERSION 1.3.5

# ======================================
# Get packages and install missing tools
# ======================================

RUN apt-get update && apt-get install -y -q \
    ruby \
    ruby-dev \
    gem
  

# =======================
# FPM + Build deb package
# =======================

RUN cd /root && gem install fpm

RUN cd /root && \
    fpm --verbose \
    --input-type dir \
    --output-type deb \
    --name fricas \
    --version $FRICAS_VERSION \
    --license BSD \
    --category "CAS" \
    --provides "binaries" \
    --maintainer "Kurt Pagani <nilqed@gmail.com>" \
    --description "https://en.wikipedia.org/wiki/FriCAS" \
    --url "http://fricas.sourceforge.net/" \
    --depends libx11-dev \
    --depends libxt-dev \ 
    --depends libice-dev \
    --depends libsm-dev \ 
    --depends libxau-dev \ 
    --depends libxdmcp-dev \ 
    --depends libxpm-dev \
/usr/local/bin/fricas /usr/local/lib/fricas/

