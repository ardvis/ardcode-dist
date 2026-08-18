cask "ardcode" do
  version "0.3.3"
  sha256 arm:          "9ec4c85f62e12483ea7002dfb8fdc18ef26b50437ec79fa42de45b583139c198",
         x86_64_linux: "4eff3ebe02bf2750be9397481806cae40bfa0f97e44623e49f78b3301902af0a"

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
