cask "ardcode" do
  version "0.7.28"
  sha256 arm:          "2d91497cd733f6ce83b4021ff1f001b5ede0e15f6b1bf03ea365e7b8bba2f1f0",
         x86_64_linux: "e8fb795c91c4c01f74cd44738a53c0abc87c9bf1b9f28fef20c0acf69b1432a7"

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
