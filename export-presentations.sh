#!/bin/bash

./export-diagrams.sh
docker run -it --rm -v $(pwd):/src -w /src marpteam/marp-cli:latest --output ./out -I . --pptx
