cask "ardcode" do
  version "0.8.44"
  sha256 arm:          "6424cdd68d5b7465d6b76fbb949206c7103034584c4a089f043b5b8bc07feaad"

  on_macos do
    url "https://github.com/ardvis/ardcode-dist/releases/download/v#{version}/ardcode-macos-arm64.tar.gz"
    depends_on macos: :tahoe
    depends_on arch: :arm64
    depends_on cask: "font-fira-code"
    app "Ardcode.app"
  end

  postflight do
    system_command "#{staged_path}/Ardcode.app/Contents/Helpers/ardcode", args: ["setup", "--managed-only"]
  end

  name "Ardcode"
  desc "Native code editor with indexed exploration and MCP integration"
  homepage "https://github.com/ardvis/ardcode-dist"

  binary "Ardcode.app/Contents/Helpers/ardcode"

end
