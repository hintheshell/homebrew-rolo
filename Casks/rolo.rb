cask "rolo" do
  version "0.1.0"
  sha256 "0000000000000000000000000000000000000000000000000000000000000000"

  url "https://github.com/hintheshell/rolo/releases/download/v#{version}/Rolo-#{version}.dmg"
  name "Rolo"
  desc "Native macOS launcher based on Tinycast"
  homepage "https://github.com/hintheshell/rolo"

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
