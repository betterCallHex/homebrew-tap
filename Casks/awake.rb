cask "awake" do
  version "1.1.1"
  sha256 "cb5c0e67401f9934de44e7de085e1fa7a81c2c2d6141986a3bbbdae333ee4a76"

  url "https://github.com/betterCallHex/awake/releases/download/v#{version}/Awake-#{version}.dmg"
  name "Awake"
  desc "Menu bar toggle that keeps the computer from sleeping"
  homepage "https://github.com/betterCallHex/awake"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :ventura

  app "Awake.app"

  uninstall quit:       "local.awake",
            login_item: "Awake"

  zap trash: "~/Library/Preferences/local.awake.plist"
end
