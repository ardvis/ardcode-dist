cask "ardcode" do
  version "0.2.0"
  sha256 "1871464812763ff694d2c93b24a3d0d23591fa2851350efa5e1d1fa68517e54a"

  url "https://github.com/ardvis/ardcode-dist/raw/refs/tags/v#{version}/releases/v#{version}/ardcode-macos-arm64.tar.gz"
  name "ArdCode"
  desc "Swift-native code graph extractor and MCP server"
  homepage "https://github.com/ardvis/ardcode"

  depends_on macos: :ventura
  depends_on arch: :arm64

  binary "ardcode"
end
