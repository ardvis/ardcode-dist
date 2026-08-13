cask "ardcode" do
  version "0.2.6"
  sha256 "9263062a39a842106adf5e7fc8e055f4b8862360211dfbe5dbea34a05a93a3ec"

  url "https://github.com/ardvis/ardcode-dist/releases/download/v#{version}/ardcode-macos-arm64.tar.gz"
  name "Ardcode"
  desc "Swift-native code graph extractor and MCP server"
  homepage "https://github.com/ardvis/ardcode-dist"

  depends_on macos: :ventura
  depends_on arch: :arm64

  binary "ardcode"
end
