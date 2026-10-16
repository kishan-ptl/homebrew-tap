cask "joystick" do
  version "1.4"
  sha256 "5af89c62b4c7aaa6eaab4efa45573cd1edef3456f914c396be6e856a03746731"

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
