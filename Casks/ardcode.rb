cask "ardcode" do
  version "0.8.15"
  sha256 arm:          "37a16d67adfb0d15c2d907fb5f3bdd47825477d9eeb7361c4f6d5bf32afc2321"

  on_macos do
    url "https://github.com/ardvis/ardcode-dist/releases/download/v#{version}/ardcode-macos-arm64.tar.gz"
    depends_on macos: :ventura
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
        args: ["setup", "--managed-only"],
        writable_paths: [".agents", ".claude", ".claude.json", ".codex", ".gemini"],
        writable_base: :home
  end
end
