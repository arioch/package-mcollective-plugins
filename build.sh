#!/bin/bash
GIT_REV=$(grep -E "^%define gitrev" mcollective-plugins.spec | awk '{print $3}')
if [ ! -d ~/rpmbuild/SOURCES ]; then mkdir -p ~/rpmbuild/SOURCES; fi
wget -O \
	~/rpmbuild/SOURCES/puppetlabs-mcollective-plugins-${GIT_REV}.tar.gz \
	https://github.com/puppetlabs/mcollective-plugins/tarball/${GIT_REV}
rpmbuild -bb mcollective-plugins.spec

