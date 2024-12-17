class Gdvm < Formula
  desc "Godot version manager focused on simplicity"
  homepage "https://github.com/patricktcoakley/gdvm"
  url "https://github.com/patricktcoakley/gdvm/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "2babe05fb6e549f26eadb21e49ed942f7ed32de12aac10663f6ade23b9c278b4"
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
