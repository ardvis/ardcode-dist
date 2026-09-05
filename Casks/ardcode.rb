cask "ardcode" do
  version "0.8.14"
  sha256 arm:          "4c9bc71b71ccbd027c95c89520f0869c93818dfe289d5734bc76156da7c0953f"

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
