cask "rolo" do
  version "0.1.3"
  sha256 "1026807ec090919a49e5ba6b9bcdbb2071d47c9119d0a5f47785f32870f49a16"

  url "https://github.com/hintheshell/rolo/releases/download/v#{version}/Rolo-#{version}.dmg"
  name "Rolo"
  desc "Native launcher based on Tinycast"
  homepage "https://github.com/hintheshell/rolo"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :tahoe

  app "Rolo.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Rolo.app"]
  end

  uninstall quit: "com.hintheshell.rolo"

  zap trash: [
    "~/Library/Application Support/com.hintheshell.rolo",
    "~/Library/Caches/com.hintheshell.rolo",
    "~/Library/Preferences/com.hintheshell.rolo.plist",
    "~/Library/Saved Application State/com.hintheshell.rolo.savedState",
  ]
end
