#!/bin/sh
# Initial Tailwind build so CSS exists before MkDocs starts
npx @tailwindcss/cli -i theme/css/input.css -o docs/css/output.css

# Tailwind in watch mode (background) with polling for Docker on macOS
npx @tailwindcss/cli -i theme/css/input.css -o docs/css/output.css --watch --poll &

# Rebuild loop: restart MkDocs whenever theme or docs files change.
# Docker Desktop on macOS doesn't propagate inotify, so we poll.
while true; do
  HASH=$(find theme docs mkdocs.yml -type f \( -name '*.html' -o -name '*.css' -o -name '*.md' -o -name '*.yml' \) -exec stat -c '%Y %n' {} + 2>/dev/null | sort | md5sum)

  if [ "$HASH" != "$PREV_HASH" ] && [ -n "$PREV_HASH" ]; then
    echo "[watcher] Change detected, restarting MkDocs..."
    kill "$MKDOCS_PID" 2>/dev/null
    wait "$MKDOCS_PID" 2>/dev/null
  fi

  if [ -z "$MKDOCS_PID" ] || ! kill -0 "$MKDOCS_PID" 2>/dev/null; then
    mkdocs serve -a 0.0.0.0:8000 --watch-theme &
    MKDOCS_PID=$!
  fi

  PREV_HASH="$HASH"
  sleep 2
done
