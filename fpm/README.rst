=====================
FPM - Package Manager
=====================
`FPM (@github) <https://github.com/jordansissel/fpm>`_

`Read the docs <https://fpm.readthedocs.io/en/latest/>`_

Example: FriCAS via Docker
==========================

An extract from the `Dockerfile <https://github.com/nilqed/fricas_docker/blob/master/fpm/fricas/Dockerfile>`_ shows how to build a ``.deb`` package by using ``fpm``  
::

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


The package can then be extracted, signed and added to a repository.
Details see `fricas_docker/fpm/fricas/ <https://github.com/nilqed/fricas_docker/tree/master/fpm/fricas>`_.

************************
Signing Debian Packages
************************
``dpkg-sig`` generates a Debian control file with several userful fields:

    * Version of dpkg-sig which generated the signature
    * Gpg key signer information
    * Role
    * Files section with checksums, file sizes, ...

Signing a Debian file with dpkg-sig is straight forward::

  $ dpkg-sig -k 8FCF1C41DC708C86 --sign builder fricas_1.3.5_amd64.deb

  Processing fricas_1.3.5_amd64.deb...
  gpg: using "8FCF1C41DC708C86" as default secret key for signing
  Signed deb fricas_1.3.5_amd64.deb

The signature can also be checked by using dpkg-sig::

  $ dpkg-sig --verify fricas_1.3.5_amd64.deb

  Processing fricas_1.3.5_amd64.deb...
  GOODSIG _gpgbuilder D56AD4357B1104A6BBA2243C8FCF1C41DC708C86 1550095747

************************
Reprepo (APT repository)
************************
`Debian Repository <https://wiki.debian.org/DebianRepository/SetupWithReprepro?action=show&redirect=SettingUpSignedAptRepositoryWithReprepro>`_

Adding packages to the repository
=================================
Reprepro takes care of signing and all, so this should suffice::

  $ reprepro includedeb <osrelease> <debfile>

Where <osrelease> on Ubuntu is something like bionic ...::

  $ cat /etc/*release*
 
Exporting the public GnuPG key
==============================
One has to export the public part of the GnuPG keypair from the keychain::

  $ gpg --armor --output whatever.gpg.key --export <key-id>

Copy ``<whatever>.gpg.key`` to a webserver so that users can download it and add it to their GnuPG keychains::

  $ wget -O - http://www.domain.com/repos/apt/conf/<whatever>.gpg.key|sudo apt-key add -

Creating a sources.list.d file
==============================
Create a list file and put it to a webserver. Its contents should be something like this::

  deb http://www.domain.com/repos/apt/debian <osrelease> main

Instruct the users to copy this file to::

   /etc/apt/sources.list.d/<something>.list.

After this, the users can install the package with::

  $ apt-get update && apt-get install <your-package-name>

