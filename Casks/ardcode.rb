cask "ardcode" do
  version "0.8.28"
  sha256 arm:          "563fb0aa312ae75d748f58b574e68501beb7401d9c8c83d47e6c0eeabb3fbfb7"

  on_macos do
    url "https://github.com/ardvis/ardcode-dist/releases/download/v#{version}/ardcode-macos-arm64.tar.gz"
    depends_on macos: :tahoe
    depends_on arch: :arm64
    depends_on formula: "sqlite"
    depends_on formula: "llama.cpp"
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
