# moss — turn a folder of markdown into a website.
#
# Installs the prebuilt moss CLI from moss-releases. The same binary also
# carries the desktop app's engine; `moss build`, `moss preview` and
# `moss --serve` run fully headless.
#
# Linux only: macOS installs the Casks/moss.rb cask instead, which ships the
# notarized moss.app bundle rather than this bare binary.
class Moss < Formula
  desc "Turn a folder of markdown notes into a website"
  homepage "https://mosspub.com"
  version "0.14.1"
  license "MIT"

  url "https://github.com/Symbiosis-Lab/moss-releases/releases/download/v0.14.1/moss-linux-x86_64"
  sha256 "bba397a0852c1f7ffdfd04ec690c4d14a136d5d925828c28634065fd9d2e5d7f"

  depends_on :linux
  depends_on arch: :x86_64

  def install
    bin.install "moss-linux-x86_64" => "moss"
  end

  def caveats
    <<~EOS
      moss currently links WebKitGTK at runtime. On Debian/Ubuntu:
        sudo apt install libwebkit2gtk-4.1-0
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/moss --version")
  end
end
