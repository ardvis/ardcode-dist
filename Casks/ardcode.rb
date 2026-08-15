cask "ardcode" do
  version "0.2.20"
  sha256 arm:          "47f7484569b34c4ec54fa7259b3989244782413715218f1a2ab04973ffe96b4d",
         x86_64_linux: "2d99108eacbd289191d2ac3e9465d04f5821f333bad3f241b73b06bc1c5654bf"

  on_macos do
    url "https://github.com/ardvis/ardcode-dist/releases/download/v#{version}/ardcode-macos-arm64.tar.gz"
    depends_on macos: :ventura
    depends_on arch: :arm64
  end

  on_linux do
    url "https://github.com/ardvis/ardcode-dist/releases/download/v#{version}/ardcode-linux-x64.tar.gz"
    depends_on arch: :x86_64
  end

  name "Ardcode"
  desc "Swift-native code graph extractor and MCP server"
  homepage "https://github.com/ardvis/ardcode-dist"

  binary "ardcode"

  postflight do
    system_command "#{staged_path}/ardcode",
                   args: ["install-global", "--force"]
  end
end
