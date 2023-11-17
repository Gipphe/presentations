#!/bin/bash

docker run -it --rm -v $(pwd):/src -w /src marpteam/marp-cli:latest **/*.md --pptx --allow-local-files
