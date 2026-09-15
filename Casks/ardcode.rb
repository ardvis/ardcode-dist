cask "ardcode" do
  version "0.8.43"
  sha256 arm:          "06d3b37f2f1ad798ca9508578b3a3496100a21e110cde9dc8d309dca7c91b7b5"

  on_macos do
    url "https://github.com/ardvis/ardcode-dist/releases/download/v#{version}/ardcode-macos-arm64.tar.gz"
    depends_on macos: :tahoe
    depends_on arch: :arm64
    depends_on cask: "font-fira-code"
    app "Ardcode.app"
  end

  postflight do
    system_command "#{staged_path}/ardcode", args: ["setup", "--managed-only"]
  end

  name "Ardcode"
  desc "Native code editor with indexed exploration and MCP integration"
  homepage "https://github.com/ardvis/ardcode-dist"

  binary "ardcode"

end
