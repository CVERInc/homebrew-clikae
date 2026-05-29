# homebrew-clikae

A [Homebrew](https://brew.sh) tap for [**clikae**](https://github.com/CVERInc/clikae) — a pure-bash CLI profile switcher for juggling multiple accounts/configs across any CLI that reads its config from an environment variable.

## Install

```bash
brew install CVERInc/clikae/clikae
```

That one-liner is shorthand for tapping this repo and installing the formula. If you prefer the explicit form:

```bash
brew tap CVERInc/clikae
brew install clikae
```

Install the latest `main` instead of the tagged release:

```bash
brew install --HEAD CVERInc/clikae/clikae
```

## Upgrade / uninstall

```bash
brew upgrade clikae
brew uninstall clikae          # your profiles under ~/.clikae are left untouched
brew untap CVERInc/clikae      # remove the tap
```

## What you get

`clikae` on your `PATH`. See the [main repo](https://github.com/CVERInc/clikae) for usage, the [docs](https://github.com/CVERInc/clikae/tree/main/docs), and the list of supported CLIs.

---

## Maintainer notes

This tap holds a single formula, `Formula/clikae.rb`. On each new tagged clikae release:

1. Update `url` to the new release tarball (`.../archive/refs/tags/vX.Y.Z.tar.gz`).
2. Update `sha256`:
   ```bash
   curl -fsSL <url> | shasum -a 256
   ```
3. Commit and push. `brew install` picks up the new version on the next `brew update`.

## License

[MIT](LICENSE) — same as clikae.
