# moss — turn a folder of markdown into a website.
#
# Installs the prebuilt moss CLI from moss-releases. The same binary also
# carries the desktop app's engine; `moss build`, `moss preview` and
# `moss --serve` run fully headless.
class Moss < Formula
  desc "Turn a folder of markdown notes into a website"
  homepage "https://mosspub.com"
  version "0.12.0"
  license "MIT"

  on_macos do
    url "https://github.com/Symbiosis-Lab/moss-releases/releases/download/v0.12.0/moss-darwin-universal"
    sha256 "0640ee7dd146cb825184257d1300e72a1bcca0b1050d6d3817e04728c6f99a85"
  end

  on_linux do
    url "https://github.com/Symbiosis-Lab/moss-releases/releases/download/v0.12.0/moss-linux-x86_64"
    sha256 "75359a28818271599443c06602e67b6912a9098bd35266cdbdb8b8a35c5f236d"

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
