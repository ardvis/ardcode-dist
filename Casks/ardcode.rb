cask "ardcode" do
  version "0.8.47"
  sha256 arm:          "ff58e81efbc451bdc429283ba8293e52d8f79f75a7af604c87a0b1e1a3a95393"

  on_macos do
    url "https://github.com/ardvis/ardcode-dist/releases/download/v#{version}/ardcode-macos-arm64.tar.gz"
    depends_on macos: :tahoe
    depends_on arch: :arm64
    depends_on cask: "font-fira-code"
    app "Ardcode.app"
  end

  postflight_steps do
    # Run the bundled CLI directly. Homebrew postflight is sandboxed and has
    # no interactive AppKit session; launching the SwiftUI app would abort
    # while NSApplication initializes, before its delegate can handle setup.
    run "{{staged_path}}/Ardcode.app/Contents/Helpers/ardcode",
        args:           ["setup", "--managed-only"],
        writable_paths: [".agents", ".claude", ".claude.json", ".codex", ".gemini"],
        writable_base:  :home
  end

  name "Ardcode"
  desc "Native code editor with indexed exploration and MCP integration"
  homepage "https://github.com/ardvis/ardcode-dist"

  binary "Ardcode.app/Contents/Helpers/ardcode"

end
