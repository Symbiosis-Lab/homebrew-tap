# moss — turn a folder of markdown into a website.
#
# Installs the prebuilt moss CLI from moss-releases. The same binary also
# carries the desktop app's engine; `moss build`, `moss preview` and
# `moss --serve` run fully headless.
class Moss < Formula
  desc "Turn a folder of markdown notes into a website"
  homepage "https://mosspub.com"
  version "0.11.7"
  license "MIT"

  on_macos do
    url "https://github.com/Symbiosis-Lab/moss-releases/releases/download/v0.11.7/moss-darwin-universal"
    sha256 "465a67d2b74476b2a211abddb51aad262bca3378cc4450806c969bfe65cb9b33"
  end

  on_linux do
    url "https://github.com/Symbiosis-Lab/moss-releases/releases/download/v0.11.7/moss-linux-x86_64"
    sha256 "80dee6d63e0acc18a1de53ae947df474d2f1ce18a58495708756daa25272e12b"

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
