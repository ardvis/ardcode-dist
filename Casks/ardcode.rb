cask "ardcode" do
  version "0.2.26"
  sha256 arm:          "26cd54e2dd7cfc461772124c835780f5dd52f5d10fe5e043beef471a1e9ab639",
         x86_64_linux: "6256465368f4e4eb77b29f9a9893355b9bf57c3f8b49de69a51df5c4cf2113bb"

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
