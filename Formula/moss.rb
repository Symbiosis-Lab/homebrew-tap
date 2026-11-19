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
    url "https://github.com/Symbiosis-Lab/moss/releases/download/v0.15.26/moss-darwin-universal"
    sha256 "0153e32e88cd455a072534f2c4bc8aa6fd9ff81a10e05301599a017ccb44ea60"
  else
    url "https://github.com/Symbiosis-Lab/moss/releases/download/v0.15.26/moss-linux-x86_64"
    sha256 "712999b8789e7fbd52164e3ff7b0716ef9f743407b8c4ee244eb597dde195c02"

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
