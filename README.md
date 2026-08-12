# ArdCode Distribution

This repository stores public, prebuilt ArdCode command-line releases. Each
release is pinned by a Git tag and contains a macOS arm64 archive plus its
SHA-256 checksum.

## Install with Homebrew

Add the distribution repository as a custom tap and install the cask:

```sh
brew tap ardvis/ardcode-dist https://github.com/ardvis/ardcode-dist.git
brew install --cask ardvis/ardcode-dist/ardcode
```

The cask installs `ardcode` into Homebrew's `bin` directory. It currently
supports Apple Silicon Macs running macOS Ventura or newer.

To remove the tap later, run `brew untap ardvis/ardcode-dist`.

## Release layout

Each release contains:

```text
releases/v<version>/ardcode-macos-arm64.tar.gz
releases/v<version>/ardcode-macos-arm64.sha256
```

The archive contains one executable named `ardcode` at its root. The checksum
file contains the SHA-256 digest of the archive.

To prepare a later release, build the matching source revision with Swift 6,
create the archive and checksum under a new version directory, update
`Casks/ardcode.rb`, and create the matching Git tag.
