class Gdvm < Formula
  desc "Godot version manager focused on simplicity"
  homepage "https://github.com/patricktcoakley/gdvm"
  url "https://github.com/patricktcoakley/gdvm/archive/refs/tags/v2.0.0.tar.gz"
  sha256 "7c3f0c7febdb68dd5a6e082a4f6960819d82655fd68ffef893abc9babf2ccf52"
  license "MIT"
  head "https://github.com/patricktcoakley/gdvm.git", branch: "main"

  depends_on "dotnet" => :build

  def install
    ENV["DOTNET_CLI_TELEMETRY_OPTOUT"] = "true"

    system "dotnet", "publish", "GDVM.CLI",
           "-c", "Release",
           "--output", buildpath / "output"

    bin.install buildpath / "output/gdvm"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/gdvm --help")
  end
end
