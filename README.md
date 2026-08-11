# Symbiosis Lab Homebrew Tap

```sh
brew install symbiosis-lab/tap/moss
```

[moss](https://mosspub.com) turns a folder of markdown notes into a website —
build, preview and publish from the command line:

```sh
moss build .
moss preview .
```

Binaries come from [moss-releases](https://github.com/Symbiosis-Lab/moss-releases).
macOS (Intel and Apple Silicon) and Linux (x86_64) are supported.

On Linux, moss currently needs WebKitGTK at runtime:
`sudo apt install libwebkit2gtk-4.1-0`.
