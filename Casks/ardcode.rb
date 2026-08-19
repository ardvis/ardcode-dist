cask "ardcode" do
  version "0.3.5"
  sha256 arm:          "f85ad68e0a09dd0a70b54e06ab31205968a9509351c00dc0cc6e8636b89eccd7",
         x86_64_linux: "e0b763b7be2eeda0b42c65ac40855cb61ade57e690114dffab23040d8644e4c5"

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
