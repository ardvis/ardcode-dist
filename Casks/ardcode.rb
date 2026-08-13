cask "ardcode" do
  version "0.2.14"
  sha256 arm:          "0aea8f523ea43f853b9368d5c4629906037195d3ac0b8022a25df173b6d2facc",
         x86_64_linux: "7c2c63d93597fdc703a20bd7aee1271216c2fc96722b89a65a07bea64acd4e1b"

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
