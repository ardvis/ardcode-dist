cask "ardcode" do
  version "0.2.11"
  sha256 "f2002e1aeb9ec4b2dc6346ceb6398e8d2872e010e04ba7d567ef4de44ac609ca"

  url "https://github.com/ardvis/ardcode-dist/releases/download/v#{version}/ardcode-macos-arm64.tar.gz"
  name "Ardcode"
  desc "Swift-native code graph extractor and MCP server"
  homepage "https://github.com/ardvis/ardcode-dist"

  depends_on macos: :ventura
  depends_on arch: :arm64

  binary "ardcode"
end
