#!/bin/bash
cd ~/goody-email
while inotifywait -e modify,create,delete -r . 2>/dev/null || fswatch -1 . 2>/dev/null || true; do
    echo "File changed, reloading..."
    sleep 0.5
done
