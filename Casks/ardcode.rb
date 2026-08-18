cask "ardcode" do
  version "0.3.1"
  sha256 arm:          "b0b1c83e4f3b6d6d4243dac9d529ea744fd7d13e057479f536b9be6cb1a815ef",
         x86_64_linux: "527e8645cb3054bf37c01f7f36ded161d17599f49db48a3704bd1642f745739b"

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
