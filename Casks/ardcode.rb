cask "ardcode" do
  version "0.2.27"
  sha256 arm:          "629105a65a52a2a8899485fa58e4aa714dd98fb8ded98d29a24674ec250734fc",
         x86_64_linux: "acebdd8f575ab9e76f9f37a44702c3b52b269f6611b392af60f8018ef25b7e9e"

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
