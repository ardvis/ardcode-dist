cask "ardcode" do
  version "0.2.12"
  sha256 "29b617cd288e4c8b87cd1009f43a7005fe9a9cb99fc4f89a48ee6209f9a3897c"

  url "https://github.com/ardvis/ardcode-dist/releases/download/v#{version}/ardcode-macos-arm64.tar.gz"
  name "Ardcode"
  desc "Swift-native code graph extractor and MCP server"
  homepage "https://github.com/ardvis/ardcode-dist"

  depends_on macos: :ventura
  depends_on arch: :arm64

  binary "ardcode"
end
