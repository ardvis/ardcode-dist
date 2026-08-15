cask "ardcode" do
  version "0.2.22"
  sha256 arm:          "e20c1778361d0f89a7d46444e46cff7f0c4a8536499ed4b2c9e574ae87782240",
         x86_64_linux: "f282e261b44990c097e80f40c7aa411cc226266592d6979b58b5b47cb664666f"

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
