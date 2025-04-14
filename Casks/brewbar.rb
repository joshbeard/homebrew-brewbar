cask "brewbar" do
  version "0.0.4"
  sha256 "0ee472b6e6c031bcaa7537c2fafa1cb83c48ddae5676e46e60c28efe78366684"

  url "https://github.com/joshbeard/BrewBar/releases/download/v#{version}/BrewBar.zip"
  name "BrewBar"
  desc "A menubar app for managing Homebrew packages"
  homepage "https://github.com/joshbeard/BrewBar"

  auto_updates true

  app "BrewBar.app"

  # Remove quarantine attribute
  postflight do
    system "xattr", "-d", "com.apple.quarantine", "#{appdir}/BrewBar.app"
  rescue
    # In case xattr command fails (which can happen if the attribute doesn't exist)
    nil
  end

  # Restart app after update
  postflight do
    set_ownership "#{appdir}/BrewBar.app"

    # Restart the app if it was running
    if system "pgrep", "-x", "BrewBar"
      system_command "pkill", args: ["-x", "BrewBar"]
      sleep 1
      system_command "open", args: ["#{appdir}/BrewBar.app"]
    end
  end

  uninstall quit:      "me.joshbeard.BrewBar",
            launchctl: "me.joshbeard.BrewBar",
            delete:    "#{appdir}/BrewBar.app"

  zap trash: [
    "~/Library/Application Support/BrewBar",
    "~/Library/Preferences/me.joshbeard.BrewBar.plist",
    "~/Library/Caches/me.joshbeard.BrewBar",
    "~/Library/Logs/BrewBar",
    "~/Library/Saved Application State/me.joshbeard.BrewBar.savedState"
  ]
end
