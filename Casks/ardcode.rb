cask "ardcode" do
  version "0.8.10"
  sha256 arm:          "ec98642f793a73a0e56d8f07157b2a04856a5fe0a4e88ba513e04ab04f72c79f",
         x86_64_linux: "c2022bb30ddb24fea3f4b9e6e0c603974fac3f67c4b21480a84dd13b646266f0"

  on_macos do
    url "https://github.com/ardvis/ardcode-dist/releases/download/v#{version}/ardcode-macos-arm64.tar.gz"
    depends_on macos: :ventura
    depends_on arch: :arm64
    depends_on formula: "sqlite"
    depends_on formula: "llama.cpp"
  end

  on_linux do
    url "https://github.com/ardvis/ardcode-dist/releases/download/v#{version}/ardcode-linux-x64.tar.gz"
    depends_on arch: :x86_64
    depends_on formula: "sqlite"
    depends_on formula: "llama.cpp"
    depends_on formula: "libsecret"
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
