cask "brewbar" do
  version "0.0.1"
  sha256 "1881307a703b0998ce5372d0c35ad1717430ff1bdae6850738e2abaea852a559"

  url "https://github.com/joshbeard/BrewBar/releases/download/v#{version}/BrewBar.zip"
  name "BrewBar"
  desc "A menubar app for managing Homebrew packages"
  homepage "https://github.com/joshbeard/BrewBar"

  app "BrewBar.app"

  postflight do
    set_ownership ["/Applications/BrewBar.app"]
    system_command "/usr/bin/xattr",
                  args: ["-cr", "/Applications/BrewBar.app"],
                  sudo: false
  end

  zap trash: [
    "~/Library/Application Support/BrewBar",
    "~/Library/Preferences/me.joshbeard.BrewBar.plist",
    "~/Library/Caches/me.joshbeard.BrewBar",
  ]
end
