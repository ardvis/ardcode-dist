cask "ardcode" do
  version "0.2.8"
  sha256 "27128d3f28b2f0708b835c1be05d5ae2460c5baf0689ecbe9e787e197a321434"

  url "https://github.com/ardvis/ardcode-dist/releases/download/v#{version}/ardcode-macos-arm64.tar.gz"
  name "Ardcode"
  desc "Swift-native code graph extractor and MCP server"
  homepage "https://github.com/ardvis/ardcode-dist"

  depends_on macos: :ventura
  depends_on arch: :arm64

  binary "ardcode"
end
