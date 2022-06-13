#!/bin/bash

today="$(date +%Y-%m-%d)"
note_filename="$HOME/notes/src/note-$today.md"

echo "$note_filename"
if [ ! -f $note_filename ]; then
    echo "# Notes for $today" > $note_filename
fi

nvim -c "norm Go" \
    -c "norm Go## $(date +%H:%M)" \
    -c "norm G2o" \
    -c "norm zz" \
    -c "startinsert" $note_filename
