# **************************************************************************
# Purpose ...: jfricas (https://github.com/fricas/jfricas.pip)
# Build .... : docker build -t jfricas:latest .
# Test ..... : docker run -ti --rm --network=host
#                --env DISPLAY=:0 nilqed/jfricas:latest jupyter notebook
# Version .. : 0.2.17 -- 17-SEP-2019
# OS ....... : ubuntu:latest
# FriCAS ... : fricas:latest
# **************************************************************************

FROM nilqed/fricas

LABEL fricas-devel <fricas-devel@googlegroups.com>

# ENV DEBIAN_FRONTEND noninteractive
# discouraged: see https://docs.docker.com/engine/faq/

ENV JFRICAS_GITHUB https://github.com/fricas/jfricas.pip
ENV JFRICAS_VERSION 1.0.0

# ======================================
# Get packages and install missing tools
# ======================================

RUN apt-get update && apt-get install -y -q \
    python3.6 \
    python3-pip \
    cl-asdf \
    cl-hunchentoot \
    firefox \
    gnuplot



# ======================================================
# Install jfricas from https://pypi.org/project/jfricas/
# pip3 install jfricas
# ======================================================

RUN cd /root && \
    pip3 install jupyter && \
    pip3 install jfricas && \
    cd /root
