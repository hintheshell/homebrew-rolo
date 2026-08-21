cask "rolo" do
  version "0.1.2"
  sha256 "318597a2b98d6d02524c33ff408122d2158fc09db82e50788f4cf8970c92eb84"

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
