cask "ardcode" do
  version "0.2.18"
  sha256 arm:          "2395484a9e2bc080dd770f7ce2a3400bb5e8da5c16d6ec72d8eb8446a41f9cf5",
         x86_64_linux: "02f8d2e1a9a41a4ad5777c81bfa24bc8bb3a96c70b6a3661d11f46effb193517"

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
