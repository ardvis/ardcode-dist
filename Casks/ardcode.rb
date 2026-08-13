cask "ardcode" do
  version "0.2.12"
  sha256 arm:          "29b617cd288e4c8b87cd1009f43a7005fe9a9cb99fc4f89a48ee6209f9a3897c",
         x86_64_linux: "5c15343f4e73b4a810904e11732705217f66c65995afc21e8026586c364bfb5e"

  on_macos do
    url "https://github.com/ardvis/ardcode-dist/releases/download/v#{version}/ardcode-macos-arm64.tar.gz"
    depends_on macos: :ventura
    depends_on arch: :arm64
  end

  on_linux do
    url "https://github.com/ardvis/ardcode-dist/releases/download/v#{version}/ardcode-linux-x64.tar.gz"
    depends_on arch: :x86_64
  end

  name "Ardcode"
  desc "Swift-native code graph extractor and MCP server"
  homepage "https://github.com/ardvis/ardcode-dist"

  binary "ardcode"
end
