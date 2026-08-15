cask "ardcode" do
  version "0.2.28"
  sha256 arm:          "a0e731373c4adf7b58e6afc6c59ab42afcd7770fac5e4967a0fa9f63634a77a6",
         x86_64_linux: "22f082ef70986ebf9d8a4f441f151e7ff741aec185cfaaf1b7116dbb3afa74d8"

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
