cask "ardcode" do
  version "0.3.6"
  sha256 arm:          "3cb6c000ca00323ed4fc994dd84dfd326e0fbc8c2d210e552ffa7f9bdba58c23",
         x86_64_linux: "cc769cc3bbc8aaff8863e0290eefd6546c897eb7e062250e10221cc14c714e2f"

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
