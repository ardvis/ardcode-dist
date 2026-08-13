cask "ardcode" do
  version "0.2.4"
  sha256 "1e51b0c3cdb7fd70ac4763a9ed473b3c4344076159828e417c839a0df44268ef"

  url "https://github.com/ardvis/ardcode-dist/raw/refs/tags/v#{version}/releases/v#{version}/ardcode-macos-arm64.tar.gz"
  name "Ardcode"
  desc "Swift-native code graph extractor and MCP server"
  homepage "https://github.com/ardvis/ardcode-dist"

  depends_on macos: :ventura
  depends_on arch: :arm64

  binary "ardcode"
end
