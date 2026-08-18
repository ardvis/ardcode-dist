cask "ardcode" do
  version "0.3.2"
  sha256 arm:          "36fc61b31e5425f8c925cc74265fb0dbb88360e1ed71ae32c87a5f316b69de53",
         x86_64_linux: "1dd2c8fb305b8f2a5acba1d8f2265708ad834b614477a3f33731ca7192df7ac8"

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
