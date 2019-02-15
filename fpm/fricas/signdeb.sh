#!/bin/sh
deb=fricas_1.3.5_amd64.deb
dpkg-sig -k 8FCF1C41DC708C86 --sign builder $deb
dpkg-sig --verify $deb
echo Now transfer $deb to repos.aisys.ch