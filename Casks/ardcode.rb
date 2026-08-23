cask "ardcode" do
  version "0.6.6"
  sha256 arm:          "d4307462ea5ef51f0b4966896e8e25970c105d96b660ee9b07744dda6978f269",
         x86_64_linux: "36cd95d359f2599e9c14f297dd94aa90168c9cef3889c92668091395dae1185e"

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
