cask "ardcode" do
  version "0.2.15"
  sha256 arm:          "620437ca7e9e9b9d6f7bd2970ca72f40445c3a19c87eef7ae9dd2755a708e301",
         x86_64_linux: "bb47d06f5d2e91c66385290bbbf792ac161ccf5ae7eaef5d92e18a2862880de0"

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
