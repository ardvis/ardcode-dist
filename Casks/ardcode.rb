cask "ardcode" do
  version "0.2.3"
  sha256 "859c36036a41a3a36960f03dcd00335cccbab2f5abb3d5341c24a95f0be55fa0"

  url "https://github.com/ardvis/ardcode-dist/raw/refs/tags/v#{version}/releases/v#{version}/ardcode-macos-arm64.tar.gz"
  name "Ardcode"
  desc "Swift-native code graph extractor and MCP server"
  homepage "https://github.com/ardvis/ardcode-dist"

  depends_on macos: :ventura
  depends_on arch: :arm64

  binary "ardcode"
end
