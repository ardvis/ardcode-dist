# Ardcode distribution agent guidance

This repository contains public Homebrew metadata for verified Ardcode
releases, not application source or release authority.

- Treat `Casks/ardcode.rb`, checksums, versions, and release metadata as output
  of Ardcode's source release workflow.
- Do not hand-edit a cask to simulate, repair, or replace a release. Run
  `make release VERSION=<next-version>` in the Ardcode source repository; that
  workflow verifies assets before committing and pushing this repository.
- Published versions, tags, assets, and checksums are immutable. Corrections use
  a new patch version.
- Keep licensing and installation documentation consistent with the actual
  published archive.

For documentation-only changes, run the available link/diff checks. Publishing,
tagging, pushing, and creating GitHub releases require explicit task scope.
