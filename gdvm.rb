class Gdvm < Formula
  desc "Godot version manager focused on simplicity"
  homepage "https://github.com/patricktcoakley/gdvm"
  url "https://github.com/patricktcoakley/gdvm/archive/refs/tags/v1.1.2.tar.gz"
  sha256 "d372ad61b21f3189d147efa82288dd4572d9e89f454355c3d27657f371b71a34"
  license "MIT"
  head "https://github.com/patricktcoakley/gdvm.git", branch: "main"

  depends_on "dotnet" => :build

  def install
    ENV["DOTNET_CLI_TELEMETRY_OPTOUT"] = "true"

    system "dotnet", "publish", "GDVM",
           "-c", "Release",
           "--output", buildpath / "output"

    bin.install buildpath / "output/gdvm"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/gdvm --help")
  end
end
