# **************************************************************************
# Purpose ...: Create packages 
# Build .... : docker build -t fricas:test .
# Test ..... : docker run -t -i fricas:test fricas
# Version .. : 03-FEB-2019
# OS ....... : ubuntu:latest 
# **************************************************************************

FROM ubuntu:latest

LABEL fpm_doc https://fpm.readthedocs.io/en/latest/index.html

# MAINTAINER Kurt Pagani <nilqed@gmail.com> 

ENV DEBIAN_FRONTEND noninteractive
# discouraged: see https://docs.docker.com/engine/faq/
# but necessary here ...

ENV FRICAS_SF https://sourceforge.net/projects/fricas/files/fricas
ENV FRICAS_VERSION 1.3.4

# ======================================
# Get packages and install missing tools
# ======================================

RUN apt-get update && \
    apt-get install -y -q \
    wget

RUN cd /root && \
    wget https://bitbucket.org/kfp/fricas_binaries/downloads/fricas_1.3.4_amd64.deb

RUN cd /root && apt install -y -q ./fricas_1.3.4_amd64.deb



