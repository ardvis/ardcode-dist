cask "ardcode" do
  version "0.2.24"
  sha256 arm:          "567b7e89b1730d400a0d42d4b019557e0fc27aaf61abb27d9149d572b78fea46",
         x86_64_linux: "0ecec1639520ae8d89ccf669dddd1eb0bf21c8e7e8f9dc55372804dfb7948158"

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
