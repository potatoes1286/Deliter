#!/bin/bash
final=$1
if [[ -z "$final" ]]; then
	echo Final destination required
	exit 1
fi

tmp=$(mktemp -d)
patchers=$tmp/patchers
dest=$tmp/dest.zip

mkdir -p "$patchers"

cp README.md Deliter/manifest.json "$tmp/"
cp media/icon/256.png "$tmp/icon.png"
cp libs/*.dll Deliter/bin/Release/net35/{Deliter,Newtonsoft.Json,DotNetZip.dll}.dll Deliter/config.yaml "$patchers/"

pushd "$tmp"
zip -9r "$dest" .
popd

mv "$dest" "$final"

rm -rf "$tmp"
