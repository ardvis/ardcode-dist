cask "ardcode" do
  version "0.2.21"
  sha256 arm:          "4a6b29c58979a190a22014601f356eefcb8789c775a0cfa1bb3ffd7582b4e3e5",
         x86_64_linux: "bd85dae783cc8713ac6548d07715d4c285dfe6de41847b423041341c6422fa3c"

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
