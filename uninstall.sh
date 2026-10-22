#!/usr/bin/env sh
set -eu

TARGET="${HOME}/.local/bin/hypr-opacity-mode"
if [ -f "$TARGET" ]; then
    rm "$TARGET"
    printf 'Removed: %s\n' "$TARGET"
else
    printf 'Not installed: %s\n' "$TARGET"
fi

printf '%s\n' 'State file remains at ~/.local/state/hypr-opacity-mode.'
