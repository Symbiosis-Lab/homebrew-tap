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
    url "https://github.com/Symbiosis-Lab/moss/releases/download/v0.15.1/moss-darwin-universal"
    sha256 "cbafcd943a697a91869dfff9c39144c24ff9f8d4a7a1e6232b1f8da4506157ee"
  else
    url "https://github.com/Symbiosis-Lab/moss/releases/download/v0.15.1/moss-linux-x86_64"
    sha256 "b5190c3b60d5c0ed96a798890db1595ae84972a3e1005d1c9363655e99bdfe14"

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
