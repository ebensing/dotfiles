#!/bin/bash

# Make Windows Edge the default browser inside WSL so `open`/xdg-open and
# $BROWSER all route to it instead of a Linux-side browser.
#
# Note: xdg-open consults the xdg-mime default handler BEFORE $BROWSER, so
# setting $BROWSER alone is not enough — this also registers a desktop entry.
# ($BROWSER itself is exported in .bashrc, which sources from this repo.)
#
# Set EDGE_PROFILE to pick an Edge profile; see edge-wsl for details.
#
# Idempotent; safe to re-run. Needs sudo only if /usr/local/bin/edge-wsl
# isn't yet linked to this repo, or to install xdg-utils.

set -euo pipefail

if ! grep -qi microsoft /proc/version 2>/dev/null; then
  echo "Not running under WSL; skipping browser setup."
  exit 0
fi

# --- Wrapper: symlink the repo's edge-wsl onto PATH -----------------------
# A symlink (not a copy) so edits to edge-wsl in this repo take effect
# without re-running this script. edge-wsl finds msedge.exe itself.
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
WRAPPER=/usr/local/bin/edge-wsl
WRAPPER_SRC="$SCRIPT_DIR/edge-wsl"

if [ "$(readlink "$WRAPPER" 2>/dev/null)" = "$WRAPPER_SRC" ]; then
  echo "$WRAPPER is up to date."
else
  echo "Linking $WRAPPER -> $WRAPPER_SRC (requires sudo)..."
  sudo ln -sfn "$WRAPPER_SRC" "$WRAPPER"
fi

# --- xdg-utils provides xdg-open/xdg-settings/xdg-mime --------------------
# Minimal WSL images don't ship it, and without it nothing below works.
if ! command -v xdg-settings > /dev/null || ! command -v xdg-mime > /dev/null; then
  echo "Installing xdg-utils (requires sudo)..."
  sudo apt-get update -qq
  sudo apt-get install -y -qq xdg-utils
fi

# --- Desktop entry so xdg-open resolves to the wrapper -------------------
DESKTOP_DIR="$HOME/.local/share/applications"
DESKTOP_FILE="$DESKTOP_DIR/msedge-windows.desktop"
mkdir -p "$DESKTOP_DIR"

cat > "$DESKTOP_FILE" <<EOF
[Desktop Entry]
Version=1.0
Name=Microsoft Edge (Windows)
Comment=Open in the Windows-side Edge browser
Exec=$WRAPPER %u
Type=Application
Terminal=false
Categories=Network;WebBrowser;
MimeType=text/html;text/xml;application/xhtml+xml;application/pdf;x-scheme-handler/http;x-scheme-handler/https;x-scheme-handler/about;x-scheme-handler/unknown;
EOF

command -v update-desktop-database > /dev/null && update-desktop-database "$DESKTOP_DIR"

# --- Register as default browser and text/html handler -------------------
# env -u BROWSER: xdg-settings refuses to run while $BROWSER is set.
# XDG_CURRENT_DESKTOP=X-Generic: xdg-utils >= 1.2 detects WSL as DE "wsl",
# which xdg-settings doesn't support ("unknown desktop environment").
xdg_settings() { env -u BROWSER XDG_CURRENT_DESKTOP=X-Generic xdg-settings "$@"; }
xdg_settings set default-web-browser msedge-windows.desktop
xdg-mime default msedge-windows.desktop \
  text/html application/xhtml+xml \
  x-scheme-handler/http x-scheme-handler/https

echo "Done. Default browser: $(xdg_settings get default-web-browser)"
echo "text/html handler:     $(xdg-mime query default text/html)"
