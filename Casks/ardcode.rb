cask "ardcode" do
  version "0.2.13"
  sha256 arm:          "25c45bded0df08927c7e358efccdb5fc09a747ce6e47f71c207b9740e72604c6",
         x86_64_linux: "e34eea9c9e38ed5aa8c25d1b396c5149517e39bc9a218b651584fd4ffcfa8cbb"

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
