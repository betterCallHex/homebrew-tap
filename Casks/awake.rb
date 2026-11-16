cask "awake" do
  version "1.2.1"
  sha256 "36408da32392ca393f13da473a951d86e872aa22b29436873473332717934477"

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
