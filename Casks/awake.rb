cask "awake" do
  version "1.2"
  sha256 "45232d3d3ce33200ab447cd8001ac549260780f93c58c67daff98de8d87a7c50"

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
