cask "brewbar" do
  version "0.0.1"
  sha256 "d4488c4f2740c0027c5e1c2681b9f7c5226f1edd4bd80f4c6a4eba13be2f39be"

  url "https://github.com/joshbeard/BrewBar/releases/download/v#{version}/BrewBar.zip"
  name "BrewBar"
  desc "A menubar app for managing Homebrew packages"
  homepage "https://github.com/joshbeard/BrewBar"

  app "BrewBar.app"

  zap trash: [
    "~/Library/Application Support/BrewBar",
    "~/Library/Preferences/me.joshbeard.BrewBar.plist",
    "~/Library/Caches/me.joshbeard.BrewBar",
  ]
end
