#!/bin/bash

DIR="${1:-.}"

for file in "$DIR"/*.MOV; do
    [ -e "$file" ] || { echo "No .mov files found."; exit 1; }

    filename="${file%.*}"

    output="${filename}.mp4"

    echo "Converting: $file → $output"

    ffmpeg -i "$file" -c:v libx264 -c:a aac -movflags +faststart "$output"

    echo "Done: $output"
    echo
done

echo "Done"

