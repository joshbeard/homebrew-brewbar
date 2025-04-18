cask "brewbar" do
  version "0.0.15"
  sha256 "36555f39b6b73de325486b7fc8be6f77b093e860653dce6c6a94b37952a5c4a6"

  url "https://github.com/joshbeard/BrewBar/releases/download/v#{version}/BrewBar.zip"
  name "BrewBar"
  desc "A menubar app for managing Homebrew packages"
  homepage "https://github.com/joshbeard/BrewBar"

  app "BrewBar.app"

  # Ensure permissions before uninstall
  uninstall_preflight do
    if File.exist?("#{appdir}/BrewBar.app")
      system_command "chown", args: ["-R", "#{ENV['USER']}:admin", "#{appdir}/BrewBar.app"]
      system_command "chmod", args: ["-R", "u+rw", "#{appdir}/BrewBar.app"]
    end
  end

  # Ensure permissions before install
  preflight do
    system_command "chown", args: ["#{ENV['USER']}:admin", "#{appdir}"]
    system_command "chmod", args: ["u+rw", "#{appdir}"]
  end

  # Remove quarantine attribute
  postflight do
    system_command "xattr", args: ["-d", "com.apple.quarantine", "#{appdir}/BrewBar.app"]
  rescue
    nil
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
