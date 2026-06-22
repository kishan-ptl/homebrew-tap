cask "joystick" do
  version "1.2"
  sha256 "eaa0565ccc54fef986c263547e216a5c51444782490ca62ffb2d7608e9ea0047"

  url "https://github.com/kishan-ptl/joystick/releases/download/v#{version}/Joystick-#{version}.dmg"
  name "Joystick"
  desc "Live dashboard of your Ghostty tabs, shell commands, and Claude sessions"
  homepage "https://github.com/kishan-ptl/joystick"

  depends_on macos: :sonoma
  depends_on formula: "jq"

  app "Joystick.app"

  zap trash: [
    "~/.config/joystick",
    "~/.local/state/joystick",
  ]

  caveats <<~EOS
    Open Joystick and click Enable to wire the shell + Claude Code hooks
    (idempotent, backs up every file it edits), then open a new terminal.
    Requires Ghostty, zsh, jq, and Claude Code.
    `brew uninstall` removes the app; run
    #{appdir}/Joystick.app/Contents/Resources/install.sh uninstall to unwire the hooks.
  EOS
end
