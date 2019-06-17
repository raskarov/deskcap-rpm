#!/bin/sh
 
_repo=x86_64

# Sign and add packages to repository
rpm --quiet --quiet --resign $_repo/*.rpm
rm -rf $_repo/repodata
createrepo $_repo

# Write package information to /packageinfo file
cd $_repo
_rpmname=`ls *.rpm | head -1`
_rpminfo=`rpm -qi $_rpmname`
cd ..
echo "$_rpminfo" > "./packageinfo"
