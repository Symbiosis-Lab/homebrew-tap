# moss — turn a folder of markdown into a website.
#
# Installs the prebuilt moss CLI from moss-releases. The same binary also
# carries the desktop app's engine; `moss build`, `moss preview` and
# `moss --serve` run fully headless.
class Moss < Formula
  desc "Turn a folder of markdown notes into a website"
  homepage "https://mosspub.com"
  version "0.11.3"
  license "MIT"

  on_macos do
    url "https://github.com/Symbiosis-Lab/moss-releases/releases/download/v0.11.3/moss-darwin-universal"
    sha256 "ecd3f56a0b2c987e3c0c730f57efcb40382b1556a3d114109a195c291862c48d"
  end

  on_linux do
    url "https://github.com/Symbiosis-Lab/moss-releases/releases/download/v0.11.3/moss-linux-x86_64"
    sha256 "34e8b4f9e9f6cba474ee49c1166d8ccf924c1d67cefd50a47eea95156232c32c"

    depends_on arch: :x86_64
  end

  def install
    binary = OS.mac? ? "moss-darwin-universal" : "moss-linux-x86_64"
    bin.install binary => "moss"
  end

  def caveats
    on_linux do
      <<~EOS
        moss currently links WebKitGTK at runtime. On Debian/Ubuntu:
          sudo apt install libwebkit2gtk-4.1-0
      EOS
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/moss --version")
  end
end
