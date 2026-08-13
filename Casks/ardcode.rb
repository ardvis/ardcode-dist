cask "ardcode" do
  version "0.2.9"
  sha256 "217fc07dc2bd95e2c3f2c5ce1918741e3adf0413409d5791e6eff0af40f16e12"

  url "https://github.com/ardvis/ardcode-dist/releases/download/v#{version}/ardcode-macos-arm64.tar.gz"
  name "Ardcode"
  desc "Swift-native code graph extractor and MCP server"
  homepage "https://github.com/ardvis/ardcode-dist"

  depends_on macos: :ventura
  depends_on arch: :arm64

  binary "ardcode"
end
