cask "ardcode" do
  version "0.2.25"
  sha256 arm:          "fd16b61c84f8827ffd780ee47a57712f5b7535a33cc35aad3a65f388d79f31d1",
         x86_64_linux: "7cea648a6ddad31bd0577d536faffdac01928443cb3c90a6a5ef2089f80e50b0"

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
