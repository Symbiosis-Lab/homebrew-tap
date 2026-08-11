# moss — turn a folder of markdown into a website.
#
# Installs the prebuilt moss CLI from moss-releases. The same binary also
# carries the desktop app's engine; `moss build`, `moss preview` and
# `moss --serve` run fully headless.
class Moss < Formula
  desc "Turn a folder of markdown notes into a website"
  homepage "https://mosspub.com"
  version "0.11.1"
  license "MIT"

  on_macos do
    url "https://github.com/Symbiosis-Lab/moss-releases/releases/download/v0.11.1/moss-darwin-universal"
    sha256 "e383168a9df6ddb00a9a5bc72dc6daa290ed422f1b26694d3349f73f98bf5e8b"
  end

  on_linux do
    url "https://github.com/Symbiosis-Lab/moss-releases/releases/download/v0.11.1/moss-linux-x86_64"
    sha256 "35d200c3c6758e9ed58a72e186e190132e0abe1ee5fb9efbb98c6f29c03eca7c"

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
