class Gdvm < Formula
  desc "Godot version manager focused on simplicity"
  homepage "https://github.com/patricktcoakley/gdvm"
  url "https://github.com/patricktcoakley/gdvm/archive/refs/tags/v0.1.7.tar.gz"
  sha256 "d29a8cf92311e594885ea6e9672f03a76c24e432b7bfe6da99077d31e0ee378b"
  license "MIT"
  head "https://github.com/patricktcoakley/gdvm.git", branch: "main"

  depends_on "dotnet-sdk" => :build

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
