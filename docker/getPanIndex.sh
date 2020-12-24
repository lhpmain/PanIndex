#!/bin/bash
version=""
if [ "$version" = "" ]
then
    version=`curl --silent "https://api.github.com/repos/lhpmain/PanIndex/releases/latest" \
        | grep '"tag_name":' \
        | sed -E 's/.*"([^"]+)".*/\1/'`
fi
curl -sOL "https://github.com/lhpmain/PanIndex/releases/download/${version}/PanIndex-${version}-linux-amd64.tar.gz"
md5sum "PanIndex-"${version}"-linux-amd64.tar.gz"
tar -xvzf "PanIndex-"${version}"-linux-amd64.tar.gz"
rm -rf README.md LICENSE CHANGELOG.md
chmod +x PanIndex
