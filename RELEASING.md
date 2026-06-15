# Releasing through this tap

This is the canonical Homebrew tap for clikae (`CVERInc/clikae`).
The publish recipe and gotchas live in the main repo:
`~/Developer/clikae/homebrew/RELEASING.md`.

## Current state (v0.6.0)

- `Formula/clikae.rb` points at the `v0.6.0` source tarball.
- sha256 `661b3cd84ab0ca470f36aa15614fa32abc6152d19f5b547ceafe580eafa890d0`
  is verified against the real GitHub tag tarball.
- `main` is already published (== `origin/main`). Nothing to push for v0.6.0.

## Human verification (read-only-ish)

```sh
brew tap CVERInc/clikae
brew audit --strict CVERInc/clikae/clikae
brew style  CVERInc/clikae/clikae
brew install --build-from-source CVERInc/clikae/clikae
brew test CVERInc/clikae/clikae
clikae version   # expect 0.6.0
```

For the NEXT release, follow the full recipe in the main repo's
`homebrew/RELEASING.md` (bump version -> commit -> tag -> push tag ->
recompute sha256 -> update this formula -> `git push origin main`).
