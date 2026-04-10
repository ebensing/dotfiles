#!/usr/bin/env bash
set -euo pipefail

if command -v but &>/dev/null; then
  echo "but already installed: $(but --version 2>/dev/null || true)"
  echo "Run 'but update install' to update."
  exit 0
fi

echo "Fetching latest GitButler release info..."
RELEASE_JSON=$(curl -fsSL "https://app.gitbutler.com/releases/latest")
VERSION=$(echo "$RELEASE_JSON" | python3 -c "import sys,json; print(json.load(sys.stdin)['version'])")
BINARY_URL=$(echo "$RELEASE_JSON" | python3 -c "import sys,json; print(json.load(sys.stdin)['platforms']['linux-x86_64']['url'])")
BASE_URL="${BINARY_URL%/but}"
DEB_URL="${BASE_URL}/GitButler_${VERSION}_amd64.deb"
DEB_FILE="/tmp/GitButler_${VERSION}_amd64.deb"

echo "Downloading GitButler ${VERSION}..."
curl -fsSL -o "$DEB_FILE" "$DEB_URL"
echo "Installing..."
sudo apt install -y "$DEB_FILE"
rm -f "$DEB_FILE"

echo "Installing built-in Claude Code skills..."
but skill install

if command -v claude &>/dev/null; then
  echo "Adding gitbutler MCP server to Claude Code..."
  claude mcp add gitbutler but mcp
else
  echo "claude not found — skipping MCP setup. Re-run 'claude mcp add gitbutler but mcp' after installing Claude Code."
fi

echo "Done. Reload your shell or run: source ~/.bashrc"
