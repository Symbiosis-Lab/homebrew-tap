# moss — turn a folder of markdown into a website.
#
# Installs the prebuilt moss CLI from moss-releases. The same binary also
# carries the desktop app's engine; `moss build`, `moss preview` and
# `moss --serve` run fully headless.
class Moss < Formula
  desc "Turn a folder of markdown notes into a website"
  homepage "https://mosspub.com"
  version "0.14.1"
  license "MIT"

  on_macos do
    url "https://github.com/Symbiosis-Lab/moss-releases/releases/download/v0.14.1/moss-darwin-universal"
    sha256 "4402e66ecb63347738661437924fd93f305b37ba8c9e88677db97663538b1948"
  end

  on_linux do
    url "https://github.com/Symbiosis-Lab/moss-releases/releases/download/v0.14.1/moss-linux-x86_64"
    sha256 "bba397a0852c1f7ffdfd04ec690c4d14a136d5d925828c28634065fd9d2e5d7f"

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
