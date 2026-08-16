cask "ardcode" do
  version "0.2.30"
  sha256 arm:          "7c46eec8a29b91b96c6f1d0e1ef8103ebb462f9bedf85d9555b8962b6c866573",
         x86_64_linux: "d939da8b46f58aa0a683426c390a5a63c61322777d86ae25136798e1a6fbbbc2"

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

  postflight do
    system_command "#{staged_path}/ardcode",
                   args: ["install-global", "--force"]
  end
end
