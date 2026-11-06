#!/usr/bin/env bash
# Point Formula/ccms.rb at a published release and fill in the real sha256 values.
# Usage: scripts/bump.sh 2.1.6
set -euo pipefail

VERSION="${1:?usage: $0 <version, e.g. 2.1.6>}"
VERSION="${VERSION#v}"
REPO="ReebanAustrive/AI-Assitant-Micro-Saas"
FORMULA="$(cd "$(dirname "$0")/.." && pwd)/Formula/ccms.rb"
TMP="$(mktemp -d)"
trap 'rm -rf "$TMP"' EXIT

sha_of() {
  local asset="$1" url="https://github.com/$REPO/releases/download/v$VERSION/$1.zip"
  curl -fsSL -o "$TMP/$asset.zip" "$url" || { echo "Missing release asset: $url" >&2; exit 1; }
  if command -v sha256sum >/dev/null; then sha256sum "$TMP/$asset.zip"; else shasum -a 256 "$TMP/$asset.zip"; fi | cut -d' ' -f1
}

MAC_SHA="$(sha_of ccms-macos-latest)"
LINUX_SHA="$(sha_of ccms-ubuntu-latest)"

# Rewrite version, both URLs, and the sha256 line that follows each URL.
perl -0pi -e '
  s/version "[^"]*"/version "'"$VERSION"'"/;
  s{download/v[^/]+/}{download/v'"$VERSION"'/}g;
  s{(ccms-macos-latest\.zip"\n\s*sha256 ")[^"]*}{${1}'"$MAC_SHA"'};
  s{(ccms-ubuntu-latest\.zip"\n\s*sha256 ")[^"]*}{${1}'"$LINUX_SHA"'};
' "$FORMULA"

echo "Updated $FORMULA to v$VERSION"
echo "  macOS: $MAC_SHA"
echo "  Linux: $LINUX_SHA"
