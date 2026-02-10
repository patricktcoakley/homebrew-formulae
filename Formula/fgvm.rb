class Fgvm < Formula
  desc "A friendly Godot version manager"
  homepage "https://github.com/patricktcoakley/fgvm"
  url "https://github.com/patricktcoakley/fgvm/archive/refs/tags/v2.0.1.tar.gz"
  sha256 "c912e0a22f90192e37b5f9975e08b70e86ef0374f0c4a47a3386258df2be7199"
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
