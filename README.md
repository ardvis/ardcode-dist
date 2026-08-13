# ArdCode Distribution

This repository stores the Homebrew cask and metadata for public Ardcode
command-line releases. Signed macOS arm64 and fully static Linux x86_64
archives, with their SHA-256 checksums, are uploaded to GitHub Release pages,
not committed to Git.

## Install with Homebrew

Add the distribution repository as a custom tap and install the cask:

```sh
brew tap ardvis/ardcode-dist https://github.com/ardvis/ardcode-dist.git
brew install --cask ardvis/ardcode-dist/ardcode
```

The cask installs `ardcode` into Homebrew's `bin` directory. It supports Apple
Silicon Macs running macOS Ventura or newer and x86_64 Linux.

To remove the tap later, run `brew untap ardvis/ardcode-dist`.

## Release assets

Each GitHub Release contains these assets:

```text
ardcode-macos-arm64.tar.gz
ardcode-macos-arm64.sha256
ardcode-linux-x64.tar.gz
ardcode-linux-x64.sha256
```

The archive contains one executable named `ardcode` at its root. The checksum
asset contains the SHA-256 digest of the archive.

To prepare a later release, build the matching source revision with Swift 6,
create the archive and checksum outside this repository, update
`Casks/ardcode.rb` to use the `releases/download` URL, create the matching Git
tag, and upload both files to the GitHub Release.
