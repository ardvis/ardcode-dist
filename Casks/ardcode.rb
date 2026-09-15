cask "ardcode" do
  version "0.8.45"
  sha256 arm:          "b4c48e047a4dbf4f40622170b3e81dfb1ef82bbf49135ad9dba7c100b6c40959"

  on_macos do
    url "https://github.com/ardvis/ardcode-dist/releases/download/v#{version}/ardcode-macos-arm64.tar.gz"
    depends_on macos: :tahoe
    depends_on arch: :arm64
    depends_on cask: "font-fira-code"
    app "Ardcode.app"
  end

  postflight_steps do
    run "{{staged_path}}/Ardcode.app/Contents/MacOS/Ardcode",
        args:           ["--managed-setup"],
        writable_paths: [".agents", ".claude", ".claude.json", ".codex", ".gemini"],
        writable_base:  :home
  end

  name "Ardcode"
  desc "Native code editor with indexed exploration and MCP integration"
  homepage "https://github.com/ardvis/ardcode-dist"

  binary "Ardcode.app/Contents/Helpers/ardcode"

end
