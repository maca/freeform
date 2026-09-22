#!/usr/bin/env bash
#
# Build the elm-book site into docs/static, ready to upload as a GitHub Pages
# artifact.
#
# A GitHub Pages *project* site lives at https://<owner>.github.io/<repo>/, not
# at the domain root, but elm-book routes and the asset URLs in index.html are
# absolute. This script therefore bakes the site's base path into both:
#
#   * src/BasePath.elm  -> ElmBook.ThemeOptions.routePrefix (client-side routes)
#   * static/index.html -> <base href="..."> (assets, incl. on 404.html deep links)
#
# The base path defaults to /<repo>/ (taken from GITHUB_REPOSITORY in Actions)
# and can be overridden with BASE_PATH, e.g. BASE_PATH="" for a custom domain or
# a user/org site served from the root.
#
# Requires `elm` 0.19.2 (the version docs/elm.json pins; install it with
# `npm install -g elm@0.19.2-0`) and a checked-out form-toolkit submodule.
#
set -euo pipefail

cd "$(dirname "$0")"

if [ "${BASE_PATH+set}" = set ]; then
  base="$BASE_PATH"
elif [ -n "${GITHUB_REPOSITORY:-}" ]; then
  base="/${GITHUB_REPOSITORY#*/}" # "owner/repo" -> "/repo"
else
  base=""
fi

# Normalise to "" or "/name" (no trailing slash).
base="${base#/}"
base="${base%/}"
prefix=""
if [ -n "$base" ]; then
  prefix="/$base"
fi

echo "Building docs for base path '${prefix}/'"

# elm-book needs routePrefix at compile time, so generate it. With an empty
# prefix this reproduces src/BasePath.elm byte for byte.
cat >src/BasePath.elm <<EOF
module BasePath exposing (basePath)

{-| Path prefix the book is served from, e.g. "/Freeform" for a GitHub Pages
project site at https://<owner>.github.io/Freeform/.

GitHub Pages project sites are *not* served from the domain root, but
elm-book's routes and the asset URLs in static/index.html are absolute, so the
prefix has to be baked into the build. That is what docs/build.sh does: it
rewrites this module. The committed value is "" so \`elm-watch\` / \`elm-live\`,
which serve from the root, work unmodified.

Do not edit by hand.

-}


basePath : String
basePath =
    "$prefix"
EOF

# index.html references its assets relatively; the <base> makes them resolve
# from the site root even when a deep link is served by 404.html. This rewrites
# the tracked file in place, so revert it (git checkout) after a local build.
sed -i.bak "s|^  <base href=\".*\">|  <base href=\"${prefix}/\">|" static/index.html
rm -f static/index.html.bak

elm make src/Main.elm --output=static/main.js

# Pages has no SPA rewrite rule: an unknown path is served as 404.html, so a
# copy of index.html lets the client-side router boot for deep links.
cp static/index.html static/404.html
