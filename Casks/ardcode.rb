cask "ardcode" do
  version "0.8.13"
  sha256 arm:          "4c325ea3707bb32855c416ff9250fb9bf65acb3336652d1b070af2a6b8a98ab4"

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
        writable_paths: [".agents", ".claude.json", ".codex", ".gemini"],
        writable_base: :home
  end
end
