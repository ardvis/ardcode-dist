cask "ardcode" do
  version "0.2.5"
  sha256 "13ef156167de4e1958837cb3fc79f5da669c17d5e0f6dc9c3e3845ccfdad52a0"

  url "https://github.com/ardvis/ardcode-dist/releases/download/v#{version}/ardcode-macos-arm64.tar.gz"
  name "Ardcode"
  desc "Swift-native code graph extractor and MCP server"
  homepage "https://github.com/ardvis/ardcode-dist"

  depends_on macos: :ventura
  depends_on arch: :arm64

  binary "ardcode"
end
