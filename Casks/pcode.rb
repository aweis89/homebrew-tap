cask "pcode" do
  version "0.1.0"
  sha256 "0000000000000000000000000000000000000000000000000000000000000000"

  url "https://github.com/aweis89/ghostty-smooth/releases/download/pcode-app-v#{version}/Pcode-#{version}-arm64.zip"
  name "Pcode"
  desc "Ghostty-based terminal with smooth scrolling, built for the pcode coding agent"
  homepage "https://github.com/aweis89/pcode"

  livecheck do
    url "https://github.com/aweis89/ghostty-smooth"
    regex(/^pcode-app-v(\d+(?:\.\d+)+)$/i)
  end

  # Updates come through `brew upgrade`; the app's own updater is disabled.
  auto_updates false
  depends_on arch: :arm64
  depends_on formula: "aweis89/tap/pcode"
  depends_on macos: :ventura

  app "Pcode.app"

  # The app is ad-hoc signed, not notarized, so Gatekeeper would refuse to
  # open it. Clearing the quarantine flag on this one bundle lets it launch.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "Pcode.app"], chdir: "{{appdir}}"
  end

  zap trash: [
    "~/Library/Caches/com.pcode.terminal",
    "~/Library/HTTPStorages/com.pcode.terminal",
    "~/Library/Preferences/com.pcode.terminal.plist",
    "~/Library/Saved Application State/com.pcode.terminal.savedState",
  ]

  caveats <<~EOS
    Pcode.app is a terminal: open it and run `pcode` in any project.
    It reads your Ghostty config (~/.config/ghostty/config) if you have one.
  EOS
end
