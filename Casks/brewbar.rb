cask "brewbar" do
  version "0.0.19"
  sha256 "9a9f458b807bd0cc473721c2ae327f969165b62f6cb0008c86bb6c9b5e70b5ad"

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
