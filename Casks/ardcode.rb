cask "ardcode" do
  version "0.2.10"
  sha256 "8f96ecd6ef749232095cf0bd7092b27a735212bb5fb9fb8b7f3310948665a832"

  url "https://github.com/ardvis/ardcode-dist/releases/download/v#{version}/ardcode-macos-arm64.tar.gz"
  name "Ardcode"
  desc "Swift-native code graph extractor and MCP server"
  homepage "https://github.com/ardvis/ardcode-dist"

  depends_on macos: :ventura
  depends_on arch: :arm64

  binary "ardcode"
end
