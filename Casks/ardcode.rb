cask "ardcode" do
  version "0.2.1"
  sha256 "3be6113cdd372ae9c6e97551f892a55d1b30a59991fee31790b3a1f52f29b171"

  url "https://github.com/ardvis/ardcode-dist/raw/refs/tags/v#{version}/releases/v#{version}/ardcode-macos-arm64.tar.gz"
  name "ArdCode"
  desc "Swift-native code graph extractor and MCP server"
  homepage "https://github.com/ardvis/ardcode"

  depends_on macos: :ventura
  depends_on arch: :arm64

  binary "ardcode"
end
