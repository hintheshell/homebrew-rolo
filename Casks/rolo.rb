cask "rolo" do
  version "0.1.1"
  sha256 "b0fcaba793427d253a7a2259526c833504de6d316a86ac6907d06d727709b8d6"

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
