cask "moss" do
  version "0.15.19"
  sha256 "86ea689c2bd9522f1fe37cdb64756f52fabf3464f417f401b653984255427d30"

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
