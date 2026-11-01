# moss — turn a folder of markdown into a website.
#
# Installs the prebuilt moss CLI: `moss build`, `moss preview` and `moss
# --serve` run fully headless, on both macOS and Linux. The desktop app is
# the separate Casks/moss.rb cask; when it's installed, `moss preview` and
# `moss edit` open it instead of only printing a URL.
class Moss < Formula
  desc "Turn a folder of markdown notes into a website"
  homepage "https://mosspub.com"
  license "MIT"

  if OS.mac?
    url "https://github.com/Symbiosis-Lab/moss/releases/download/v0.15.17/moss-darwin-universal"
    sha256 "5ac4ce5d5a7938bafde34f75ac91fe25c816ffee847b7a33c409a65a49603ef0"
  else
    url "https://github.com/Symbiosis-Lab/moss/releases/download/v0.15.17/moss-linux-x86_64"
    sha256 "0031e12f86d1e7500f7190b7ef448c2854f0699290489450dd3ddc0904ad12a6"

    depends_on arch: :x86_64
  end

  def install
    if OS.mac?
      bin.install "moss-darwin-universal" => "moss"
    else
      bin.install "moss-linux-x86_64" => "moss"
    end
  end

  def caveats
    return unless OS.linux?

    <<~EOS
      This version of moss links WebKitGTK at runtime. On Debian/Ubuntu:
        sudo apt install libwebkit2gtk-4.1-0
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/moss --version")
  end
end
