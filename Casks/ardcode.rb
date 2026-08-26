cask "ardcode" do
  version "0.7.21"
  sha256 arm:          "c1004baf49bbe4f73fc3cc10222895e4d244a8e1c2a132b39bbd2760cf3ef2b4",
         x86_64_linux: "9a20951c835189653a2b2de070fab7f91094d4c41e0ee10f75e3ea032fe5d4a7"

  on_macos do
    url "https://github.com/ardvis/ardcode-dist/releases/download/v#{version}/ardcode-macos-arm64.tar.gz"
    depends_on macos: :ventura
    depends_on arch: :arm64
    depends_on formula: "sqlite"
    depends_on formula: "llama.cpp"
    artifact "Ardcode_ArdcodeCLI.bundle",
             target: "#{HOMEBREW_PREFIX}/bin/Ardcode_ArdcodeCLI.bundle"
  end

  on_linux do
    url "https://github.com/ardvis/ardcode-dist/releases/download/v#{version}/ardcode-linux-x64.tar.gz"
    depends_on arch: :x86_64
    depends_on formula: "sqlite"
    depends_on formula: "llama.cpp"
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
