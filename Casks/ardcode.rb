cask "ardcode" do
  version "0.2.16"
  sha256 arm:          "543911d1a5d53725ca86bc9f4e308803fe41f936691adeeb3c34dba587208de7",
         x86_64_linux: "2f643d24fa129f834bf956f631c8d6a1eb1f19238c74af3591b6aaccdedf41c6"

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
