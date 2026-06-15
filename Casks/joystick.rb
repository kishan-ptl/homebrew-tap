cask "joystick" do
  version "1.1"
  sha256 "02d6980734d3d15f1fa1cb977b50bea8e291c69f7cf5f5cc607c5b327e9a4ec6"

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
