cask "flick" do
  version "0.5.0"
  sha256 "c57e81b396a611e0b8c1485e101d0da36ea1bfeafbb6ddf451dc4286739b6a10"

  url "https://github.com/betterCallHex/flick/releases/download/v#{version}/Flick-#{version}.dmg"
  name "Flick"
  desc "Fast, quiet video player built on libmpv"
  homepage "https://github.com/betterCallHex/flick"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on formula: "yt-dlp"
  depends_on macos: :sequoia

  app "Flick.app"

  uninstall quit: "local.flick.player"

  zap trash: [
    "~/Library/Application Support/Flick",
    "~/Library/Caches/local.flick.player",
    "~/Library/HTTPStorages/local.flick.player",
    "~/Library/HTTPStorages/local.flick.player.binarycookies",
    "~/Library/Preferences/local.flick.player.plist",
  ]
end
