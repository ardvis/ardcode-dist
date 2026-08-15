cask "ardcode" do
  version "0.2.23"
  sha256 arm:          "5970bf089ac0ae4d3d62836a387b503bdc6710952b30a18f1466b77da643d86e",
         x86_64_linux: "6ce0a035a1dbbc94476385f39e0ce20dfc1f7e2b9041291edff308a75ac544be"

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
