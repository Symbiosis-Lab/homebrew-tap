# Symbiosis Lab Homebrew Tap

CLI, macOS and Linux:

```sh
brew install symbiosis-lab/tap/moss
```

Desktop app (macOS only):

```sh
brew install --cask symbiosis-lab/tap/moss
```

On macOS the name `moss` is both a formula and a cask, so the cask needs `--cask`.

[moss](https://mosspub.com) turns a folder of markdown notes into a website — build, preview and publish from the command line:

```sh
moss build .
moss preview .
```

The formula installs the CLI binary as `bin/moss` on both macOS and Linux. If the desktop app is also installed, `moss preview` and `moss edit` open it instead of only printing a URL.

The cask installs the notarized `moss.app` bundle to Applications; it no longer links a `moss` binary onto PATH, since the formula owns that now. If you already have `moss.app` in Applications from the DMG, Homebrew refuses to overwrite it; add `--adopt` to take over the existing copy when it matches the release, or move it aside first.

On Linux (x86_64), this version of `moss` needs WebKitGTK at runtime: `sudo apt install libwebkit2gtk-4.1-0`.

Binaries and the macOS app come from [moss](https://github.com/Symbiosis-Lab/moss).
