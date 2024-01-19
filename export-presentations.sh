#!/usr/bin/env sh

./export-diagrams.sh
mkdir -p out
chmod 777 out
rm -rf out/*.pptx
docker run -it --rm -e "UID=$(id -u)" -e "GID=$(id -g)" -v "$(pwd):/src" -w /src --entrypoint ash marpteam/marp-cli:latest "/src/marp.sh"
