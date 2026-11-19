#!/usr/bin/env bash
# Writes Formula/moss.rb and Casks/moss.rb for one moss release. Edit the
# formula and the cask here: update-formula.yml rewrites both files from this
# script at every release.
#
# Inputs (environment): VERSION, MAC_CLI, LINUX_CLI, DMG_NAME (the release's
# file names) and DARWIN, LINUX, DMG (their sha256s).
set -euo pipefail
cd "$(dirname "$0")/.."
: "${VERSION:?}" "${MAC_CLI:?}" "${LINUX_CLI:?}" "${DMG_NAME:?}" "${DARWIN:?}" "${LINUX:?}" "${DMG:?}"
RELEASE="https://github.com/Symbiosis-Lab/moss/releases/download/v$VERSION"

cat > Formula/moss.rb <<EOF
# moss — turn a folder of markdown into a website.
#
# Installs the prebuilt moss CLI: \`moss build\`, \`moss preview\` and \`moss
# --serve\` run fully headless, on both macOS and Linux. The desktop app is
# the separate Casks/moss.rb cask; when it's installed, \`moss preview\` and
# \`moss edit\` open it instead of only printing a URL.
class Moss < Formula
  desc "Turn a folder of markdown notes into a website"
  homepage "https://mosspub.com"
  license "MIT"

  if OS.mac?
    url "$RELEASE/$MAC_CLI"
    sha256 "$DARWIN"
  else
    url "$RELEASE/$LINUX_CLI"
    sha256 "$LINUX"

    depends_on arch: :x86_64
  end

  def install
    if OS.mac?
      bin.install "$MAC_CLI" => "moss"
    else
      bin.install "$LINUX_CLI" => "moss"
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/moss --version")
  end
end
EOF

# The dmg name may carry the version; the cask's url names it through
# #{version} so \`brew livecheck\` reads one version line.
VERSION_REF='#{version}'
DMG_URL_NAME="${DMG_NAME//$VERSION/$VERSION_REF}"
cat > Casks/moss.rb <<EOF
cask "moss" do
  version "$VERSION"
  sha256 "$DMG"

  url "https://github.com/Symbiosis-Lab/moss/releases/download/v#{version}/$DMG_URL_NAME"
  name "moss"
  desc "Turn a folder of markdown notes into a website"
  homepage "https://mosspub.com/"

  livecheck do
    url :url
    strategy :github_latest
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  auto_updates true
  depends_on macos: :monterey

  app "moss.app"

  zap trash: [
    "~/Library/Application Support/host.moss.publisher",
    "~/Library/Caches/host.moss.publisher",
    "~/Library/Preferences/host.moss.publisher.plist",
    "~/Library/Saved Application State/host.moss.publisher.savedState",
    "~/Library/WebKit/host.moss.publisher",
  ]
end
EOF
