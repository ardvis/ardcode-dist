cask "ardcode" do
  version "0.2.19"
  sha256 arm:          "d8d4588a5e7da634bb2701a292560c1ca6526a392154106a03ec292cc98684c1",
         x86_64_linux: "ad42b49b41b47e3d886e3f389913ce4c8276f32449ad7df137c558434d66d52b"

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
