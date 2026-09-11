cask "ardcode" do
  version "0.8.31"
  sha256 arm:          "af6ac2e102f185b30777540b5c8f0a844a872bfe7e7f61f7b58a59e49742dc42"

  on_macos do
    url "https://github.com/ardvis/ardcode-dist/releases/download/v#{version}/ardcode-macos-arm64.tar.gz"
    depends_on macos: :tahoe
    depends_on arch: :arm64
    depends_on formula: "sqlite"
    depends_on formula: "llama.cpp"
    app "Ardcode.app"
  end

  name "Ardcode"
  desc "Swift-native code graph extractor and MCP server"
  homepage "https://github.com/ardvis/ardcode-dist"

  binary "ardcode"

  postflight_steps do
    run "{{staged_path}}/ardcode",
        args:           ["setup", "--managed-only"],
        writable_paths: [".agents", ".claude", ".claude.json", ".codex", ".gemini"],
        writable_base:  :home
  end
end
