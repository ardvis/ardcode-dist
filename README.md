# ArdCode Distribution

This repository stores the Homebrew cask and metadata for public Ardcode
releases. Each release contains the unified, signed macOS app and its bundled
command-line tool for Apple silicon. Archives and their SHA-256 checksums are
uploaded to GitHub Release pages, not committed to Git.

## Install with Homebrew

Add the distribution repository as a custom tap and install the cask:

```sh
brew tap ardvis/ardcode-dist https://github.com/ardvis/ardcode-dist.git
brew install --cask ardvis/ardcode-dist/ardcode
```

The cask installs `Ardcode.app` and links its bundled `ardcode` helper into
Homebrew's `bin` directory. Ardcode supports Apple silicon Macs running macOS
Tahoe or newer.

To remove the tap later, run `brew untap ardvis/ardcode-dist`.

## Release assets

Each GitHub Release contains these assets:

```text
ardcode-macos-arm64.tar.gz
ardcode-macos-arm64.sha256
ardcode-<version>.spdx.json
```

New releases include the `ardcode` executable, its adjacent SwiftPM resource
bundle, and a `Legal` directory containing original third-party notices,
software-rights information, a privacy summary, and provenance. Keep the resource
bundle beside the executable when installing manually. The checksum asset
contains the SHA-256 digest of the archive.

Read [licensing and legal information](LICENSING.md). In releases with legal
resources, use `ardcode licenses` or open **Legal & privacy** in the Ardcode
app. Consult the notices bundled with your exact version; this documentation
does not retrofit notices into earlier releases.

## Release ownership

The checked-out `ardcode-dist` directory is the authoritative Homebrew
publication checkout for the workspace. Run the release from the workspace:

```sh
make -C ardcode release VERSION="<next-version>"
```

The source release creates and verifies the GitHub assets and attestation, then
updates, commits, and pushes `Casks/ardcode.rb` here. Do not build archives,
create tags, upload releases, or edit the cask manually; a correction requires a
new patch version.
