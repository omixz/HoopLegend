#!/usr/bin/env bash
# Builds upload-ready packages for every web portal from the single game file,
# into release/ at the repo root (committed, so the files are always at hand):
#   release/itch/        index.html            + hoop-legends-itch.zip
#   release/poki/        index.html + Poki SDK + hoop-legends-poki.zip
#   release/crazygames/  index.html + CG SDK   + hoop-legends-crazygames.zip
#   release/store-art/   cover, thumbnail, icon, screenshots
# The game detects whichever SDK is present (see the Platform shim) and falls back
# to plain offline play when none is, so the same source works everywhere.
set -euo pipefail
DIR="$(cd "$(dirname "$0")" && pwd)"
SRC="$DIR/../basketball-rpg.html"
OUT="$DIR/../release"
rm -rf "$OUT/itch" "$OUT/poki" "$OUT/crazygames" "$OUT"/*.zip "$OUT/store-art"; mkdir -p "$OUT"

build(){  # build <name> <sdk-script-tag-or-empty>
  local name="$1" tag="$2"
  mkdir -p "$OUT/$name"
  if [ -n "$tag" ]; then
    # insert the SDK <script> right after <title>, before the game script runs
    awk -v tag="$tag" '{ print } /<\/title>/ && !done { print tag; done=1 }' "$SRC" > "$OUT/$name/index.html"
  else
    cp "$SRC" "$OUT/$name/index.html"
  fi
  ( cd "$OUT/$name" && rm -f "../hoop-legends-$name.zip" && zip -q -X -r "../hoop-legends-$name.zip" index.html )
  echo "  release/hoop-legends-$name.zip"
}

echo "Built:"
build itch ""
build poki '<script src="https://game-cdn.poki.com/scripts/v2/poki-sdk.js"></script>'
build crazygames '<script src="https://sdk.crazygames.com/crazygames-sdk-v3.js"></script>'
cp -r "$DIR/assets" "$OUT/store-art"
echo "  release/store-art/"
