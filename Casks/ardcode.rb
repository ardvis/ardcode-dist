cask "ardcode" do
  version "0.8.16"
  sha256 arm:          "3548fcff850f4ce2dac03b442f464779350fe476ba2d4461225e10cb96062563"

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
