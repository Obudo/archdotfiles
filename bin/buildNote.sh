#!/bin/sh

filename=$1
target="$(dirname "${filename}")/../pdf"
output_file="$(basename "$filename" .md).pdf"

mkdir -p $target

pandoc \
    -V "geometry:margin=1in" \
    -o "$target/$output_file" $filename &

