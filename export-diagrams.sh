#!/usr/bin/env sh

docker run -it --rm -v "$(pwd):/src" plantuml/plantuml -- '/src/**/*.puml' -tpng -o './out'
echo "Exported all PlantUML diagrams"
