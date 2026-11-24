# aweis89/tap

Homebrew tap for [pcode](https://github.com/aweis89/pcode).

```sh
brew install aweis89/tap/pcode          # the pcode CLI
brew install --cask aweis89/tap/pcode   # Pcode.app plus the CLI
```

The formula and the cask share the name `pcode`, so `--cask` is what picks the
app, for `brew upgrade` too.

## Pcode.app

A build of [Ghostty](https://ghostty.org) from
[aweis89/ghostty-smooth](https://github.com/aweis89/ghostty-smooth) that
scrolls pcode's streamed output in smoothly. Apple Silicon only, macOS 13+.
It installs beside stock Ghostty and reads your Ghostty config.

The app is built in that repo's
[`pcode-app` workflow](https://github.com/aweis89/ghostty-smooth/blob/pcode-smooth/.github/workflows/pcode-app.yml)
and ad-hoc signed, not notarized by Apple. So that Gatekeeper lets it open,
the cask clears the quarantine flag on `Pcode.app` after installing it (and
nothing else). A zip downloaded from the releases page by hand stays blocked.

## Maintenance

Release workflows bump the `version` and `sha256` lines: pcode's for
`Formula/pcode.rb`, ghostty-smooth's for `Casks/pcode.rb`. Make any other
change here.
