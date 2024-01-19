#!/usr/bin/env sh

for f in **/*.md; do
  final_name="$(basename -- "$f")"
  final_name="${final_name%.md}.pptx"
  docker-entrypoint --pptx --output "./out/$final_name" "$f"
done

chown $UID:$GID ./out/*
