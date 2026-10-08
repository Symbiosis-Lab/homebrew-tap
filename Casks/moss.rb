cask "moss" do
  version "0.15.9"
  sha256 "a62a1111a0a493fa020f0cf6b3a02de218dfdfcd256bb12238278492b5da3e06"

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
