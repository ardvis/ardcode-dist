cask "ardcode" do
  version "0.2.17"
  sha256 arm:          "4f164b8382d17b15334faa2aa5611e13977e5e112ead86c1eada80a171fb8403",
         x86_64_linux: "b8297ed7818b50b9791cd555d7d10bd1052c974ea07a3c3c3381c3b82f7dad06"

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
