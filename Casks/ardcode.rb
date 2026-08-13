cask "ardcode" do
  version "0.2.2"
  sha256 "01f89994e714811703f329d81e3691ae3466f809ff7f5b7e2e488db6dc8c448b"

  url "https://github.com/ardvis/ardcode-dist/raw/refs/tags/v#{version}/releases/v#{version}/ardcode-macos-arm64.tar.gz"
  name "ArdCode"
  desc "Swift-native code graph extractor and MCP server"
  homepage "https://github.com/ardvis/ardcode-dist"

  depends_on macos: :ventura
  depends_on arch: :arm64

  binary "ardcode"
end
