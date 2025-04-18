cask "brewbar" do
  version "0.0.17"
  sha256 "dd27064832de428387bd16953453a5cad1660b3df750a3ca7ec82517e1dccc94"

  url "https://github.com/joshbeard/BrewBar/releases/download/v#{version}/BrewBar.zip"
  name "BrewBar"
  desc "A menubar app for managing Homebrew packages"
  homepage "https://github.com/joshbeard/BrewBar"

  app "BrewBar.app"

  # Remove quarantine attribute
  postflight do
    system_command "xattr", args: ["-d", "com.apple.quarantine", "#{appdir}/BrewBar.app"]
  rescue
    nil
  end

  uninstall quit:      "me.joshbeard.BrewBar",
            launchctl: "me.joshbeard.BrewBar"

  zap trash: [
    "~/Library/Application Support/BrewBar",
    "~/Library/Preferences/me.joshbeard.BrewBar.plist",
    "~/Library/Caches/me.joshbeard.BrewBar",
    "~/Library/Logs/BrewBar",
    "~/Library/Saved Application State/me.joshbeard.BrewBar.savedState"
  ]
end
