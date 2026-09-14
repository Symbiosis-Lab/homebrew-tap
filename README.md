# Symbiosis Lab Homebrew Tap

macOS:

```sh
brew install --cask symbiosis-lab/tap/moss
```

Linux:

```sh
brew install symbiosis-lab/tap/moss
```

[moss](https://mosspub.com) turns a folder of markdown notes into a website — build, preview and publish from the command line:

```sh
moss build .
moss preview .
```

On macOS, `moss` installs as the notarized `moss.app` bundle, with the CLI linked into `bin/moss`. If you installed `moss` as a formula before this change, switch over once: `brew uninstall moss && brew install --cask symbiosis-lab/tap/moss`.

On Linux (x86_64), `moss` installs as a bare CLI binary and currently needs WebKitGTK at runtime: `sudo apt install libwebkit2gtk-4.1-0`.

Binaries and the macOS app come from [moss-releases](https://github.com/Symbiosis-Lab/moss-releases).
