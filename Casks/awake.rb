cask "awake" do
  version "1.1.2"
  sha256 "255c16d4b51153034002fb91a98679c9a513e03176f3f750e95d370b3ac1fa44"

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
