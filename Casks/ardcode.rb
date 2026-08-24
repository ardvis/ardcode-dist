cask "ardcode" do
  version "0.7.1"
  sha256 arm:          "a83fd9c758a4d75493f00d684d9f0635d9ceb1ac71cf3d25cf3953e736f06175",
         x86_64_linux: "84cb39a525f3f9acc2466b233d33b60b6476e9544c937435ee73de2c2adaa858"

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
                   args: ["setup", "--managed-only"]
  end
end
