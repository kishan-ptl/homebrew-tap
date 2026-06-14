cask "joystick" do
  version "1.0"
  sha256 "97b25dc841c16c57a00475c0d6457ff83c66b6577522f573d1cb1c968b8051a7"

  url "https://github.com/kishan-ptl/joystick/releases/download/v#{version}/Joystick-#{version}.dmg"
  name "Joystick"
  desc "Live dashboard of your Ghostty tabs, shell commands, and Claude sessions"
  homepage "https://github.com/kishan-ptl/joystick"

  depends_on macos: :sonoma

  app "Joystick.app"

  zap trash: [
    "~/.config/joystick",
    "~/.local/state/joystick",
  ]

  caveats <<~EOS
    After installing, open Joystick and run the one-time setup (or
    #{appdir}/Joystick.app/Contents/Resources/install.sh) to wire the
    shell + Claude Code hooks. Requires Ghostty, zsh, jq, and Claude Code.
    `brew uninstall` removes the app; run install.sh uninstall to unwire the hooks.
  EOS
end
