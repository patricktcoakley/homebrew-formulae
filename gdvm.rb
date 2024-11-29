class Gdvm < Formula
  desc "A Godot version manager focused on simplicity."
  homepage "https://github.com/patricktcoakley/gdvm"
  url "https://github.com/patricktcoakley/gdvm/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "a050503954adb712e97bd0aecc464e5bc16476196b5e1aa1f021b1369a138198"
  license "MIT"
  head "https://github.com/patricktcoakley/gdvm.git", branch: "main"

  depends_on "dotnet" => :build

  def install
    ENV["DOTNET_CLI_TELEMETRY_OPTOUT"] = "true"

    system "dotnet", "publish", "GDVM",
           "-c", "Release",
           "--output", buildpath/"output"

    bin.install buildpath/"output/gdvm"
          end

  test do
    assert_match "Usage:", shell_output("#{bin}/gdvm --help")
  end
end