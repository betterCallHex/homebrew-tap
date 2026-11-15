cask "awake" do
  version "1.1"
  sha256 "7fae6f6ef4227105eadcb38a71483f227a42cd8d16e77c50a08c2631b2168c58"

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
