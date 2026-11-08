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
    url "https://github.com/Symbiosis-Lab/moss/releases/download/v0.15.19/moss-darwin-universal"
    sha256 "def181990bc24c509731ea947260982c2f20de793472a11b2b6cdad0f0f9d575"
  else
    url "https://github.com/Symbiosis-Lab/moss/releases/download/v0.15.19/moss-linux-x86_64"
    sha256 "3a98dceee4d3468201625d8bfd7943cde27782e8a95faf169e0798e4c4aface2"

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
