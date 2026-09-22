module BasePath exposing (basePath)

{-| Path prefix the book is served from, e.g. "/Freeform" for a GitHub Pages
project site at https://<owner>.github.io/Freeform/.

GitHub Pages project sites are *not* served from the domain root, but
elm-book's routes and the asset URLs in static/index.html are absolute, so the
prefix has to be baked into the build. That is what docs/build.sh does: it
rewrites this module. The committed value is "" so `elm-watch` / `elm-live`,
which serve from the root, work unmodified.

Do not edit by hand.

-}


basePath : String
basePath =
    ""
