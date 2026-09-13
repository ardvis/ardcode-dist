cask "ardcode" do
  version "0.8.36"
  sha256 arm:          "ebc67cf16699a0c1216910f09662dfb0003bd5d533a5f6b932a11a168b32f9d1"

  on_macos do
    url "https://github.com/ardvis/ardcode-dist/releases/download/v#{version}/ardcode-macos-arm64.tar.gz"
    depends_on macos: :tahoe
    depends_on arch: :arm64
    depends_on formula: "sqlite"
    depends_on cask: "font-fira-code"
    app "Ardcode.app"
  end

  name "Ardcode"
  desc "Native code editor with indexed exploration and MCP integration"
  homepage "https://github.com/ardvis/ardcode-dist"

  binary "ardcode"

  postflight_steps do
    run "{{staged_path}}/ardcode",
        args:           ["setup", "--managed-only"],
        writable_paths: [".agents", ".claude", ".claude.json", ".codex", ".gemini"],
        writable_base:  :home
  end
end
