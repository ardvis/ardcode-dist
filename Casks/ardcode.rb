cask "ardcode" do
  version "0.2.29"
  sha256 arm:          "3334bc67828ad1a474c231e6f2192096cbf9de35c5ed13960159464e6d3d9614",
         x86_64_linux: "ab56599500856920fef6f4357120bfcf2909389f0a1c260a24934ce6add8d03e"

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
