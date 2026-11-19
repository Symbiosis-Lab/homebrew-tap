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
    url "https://github.com/Symbiosis-Lab/moss/releases/download/v0.15.27/moss-darwin-universal"
    sha256 "410e4c570e2b600c22e9c0f27d6112b08587ec42a89e9e8ea283d4e2760a87e9"
  else
    url "https://github.com/Symbiosis-Lab/moss/releases/download/v0.15.27/moss-linux-x86_64"
    sha256 "d444fd9fa115965c114a43495a9d661dfb16a49c1bd9a70acbe2e9e1e467c743"

    depends_on arch: :x86_64
  end

  def install
    if OS.mac?
      bin.install "moss-darwin-universal" => "moss"
    else
      bin.install "moss-linux-x86_64" => "moss"
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/moss --version")
  end
end
