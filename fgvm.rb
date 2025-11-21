class Fgvm < Formula
  desc "A friendly Godot version manager"
  homepage "https://github.com/patricktcoakley/fgvm"
  url "https://github.com/patricktcoakley/fgvm/archive/refs/tags/v2.0.0.tar.gz"
  sha256 "7c3f0c7febdb68dd5a6e082a4f6960819d82655fd68ffef893abc9babf2ccf52"
  license "MIT"
  head "https://github.com/patricktcoakley/fgvm.git", branch: "main"

  depends_on "dotnet" => :build

  def install
    ENV["DOTNET_CLI_TELEMETRY_OPTOUT"] = "true"

    system "dotnet", "publish", "Fgvm.Cli",
           "-c", "Release",
           "--output", buildpath / "output"

    bin.install buildpath / "output/fgvm"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/fgvm --help")
  end
end
