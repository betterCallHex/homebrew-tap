cask "flick" do
  version "0.4.0"
  sha256 "b0cdd99334a3aefca47c9e6f882df17ceae75034c42d048a87a4db03e2512d3d"

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
