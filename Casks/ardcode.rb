cask "ardcode" do
  version "0.2.7"
  sha256 "47d5036048b43d5b1914dacdc31aebcd0592fdb15d430f70357e25edfe5011dd"

  url "https://github.com/ardvis/ardcode-dist/releases/download/v#{version}/ardcode-macos-arm64.tar.gz"
  name "Ardcode"
  desc "Swift-native code graph extractor and MCP server"
  homepage "https://github.com/ardvis/ardcode-dist"

  depends_on macos: :ventura
  depends_on arch: :arm64

  binary "ardcode"
end
