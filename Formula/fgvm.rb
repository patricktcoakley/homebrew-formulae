class Fgvm < Formula
  desc "A friendly Godot version manager"
  homepage "https://github.com/patricktcoakley/fgvm"
  url "https://github.com/patricktcoakley/fgvm/archive/refs/tags/v2.1.0.tar.gz"
  sha256 "3dad455d77c2459841b0b8af67dd064d2dc714129fec6cc1d66c2afc39c3ed13"
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
