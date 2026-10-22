#!/usr/bin/env sh
set -eu

PREFIX="${HOME}/.local"
BIN_DIR="${PREFIX}/bin"
TARGET="${BIN_DIR}/hypr-opacity-mode"
SCRIPT_DIR=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)

if ! command -v hyprctl >/dev/null 2>&1; then
    printf '%s\n' 'Error: hyprctl not found. Run installer inside Hyprland.' >&2
    exit 1
fi

mkdir -p "$BIN_DIR"
if [ -e "$TARGET" ] && [ ! -L "$TARGET" ]; then
    cp "$TARGET" "$TARGET.backup.$(date +%Y%m%d%H%M%S)"
fi
cp "$SCRIPT_DIR/hypr-opacity-mode" "$TARGET"
chmod 755 "$TARGET"

printf 'Installed: %s\n' "$TARGET"
printf '%s\n' 'Bind Super+O to:'
printf '%s\n' '  ~/.local/bin/hypr-opacity-mode toggle'
printf '%s\n' 'Run transparent mode now:'
printf '%s\n' '  ~/.local/bin/hypr-opacity-mode transparent'
