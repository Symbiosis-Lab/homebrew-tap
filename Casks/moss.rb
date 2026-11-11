cask "moss" do
  version "0.15.21"
  sha256 "f990ab8d98745ad335cec051b6f57d96d623d90058bfc057cec78cbad6164c52"

  url "https://github.com/Symbiosis-Lab/moss/releases/download/v#{version}/moss_#{version}_universal.dmg"
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
