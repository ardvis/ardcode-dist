cask "ardcode" do
  version "0.3.0"
  sha256 arm:          "cd493648aea0f1f4c2b688bd1e7d97f35bdc87f40fd1b7fc52cf023a0c86416d",
         x86_64_linux: "670e04bf3326f697ce0b3c708bc4981975e2324645fe8135006200f35e70e114"

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
