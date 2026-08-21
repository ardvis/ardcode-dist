cask "ardcode" do
  version "0.4.18"
  sha256 arm:          "f6a00e5170e058896d2ae4ff0f37e8633d30687f7b646d502caa10faed14e4e1",
         x86_64_linux: "6e0f6294bb579bb8f6bb375f04e4b5ee301cfc3efcefcdc2da2be7ad40379b76"

  on_macos do
    url "https://github.com/ardvis/ardcode-dist/releases/download/v#{version}/ardcode-macos-arm64.tar.gz"
    depends_on macos: :ventura
    depends_on arch: :arm64
    depends_on formula: "sqlite"
    artifact "Ardcode_ArdcodeCLI.bundle",
             target: "#{HOMEBREW_PREFIX}/bin/Ardcode_ArdcodeCLI.bundle"
  end

  on_linux do
    url "https://github.com/ardvis/ardcode-dist/releases/download/v#{version}/ardcode-linux-x64.tar.gz"
    depends_on arch: :x86_64
    depends_on formula: "sqlite"
    depends_on formula: "libsecret"
    artifact "Ardcode_ArdcodeCLI.resources",
             target: "#{HOMEBREW_PREFIX}/bin/Ardcode_ArdcodeCLI.resources"
  end

  name "Ardcode"
  desc "Swift-native code graph extractor and MCP server"
  homepage "https://github.com/ardvis/ardcode-dist"

  binary "ardcode"
  postflight do
    system_command "#{staged_path}/ardcode",
                   args: ["install-global", "--managed-only"]
  end
end
