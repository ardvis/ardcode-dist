cask "ardcode" do
  version "0.2.31"
  sha256 arm:          "622e3a215fdc05a21cd72079fff34ef950f86a1e640908bb0be17bbb4690c39a",
         x86_64_linux: "050ffdcf31183a39948af0a973a4309f930717a8c9b068f8504505b36b0081cf"

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
