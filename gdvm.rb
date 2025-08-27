class Gdvm < Formula
  desc "Godot version manager focused on simplicity"
  homepage "https://github.com/patricktcoakley/gdvm"
  url "https://github.com/patricktcoakley/gdvm/archive/refs/tags/v1.2.4.tar.gz"
  sha256 "f409799e356c3c88d38da736b055a540b0837693aab2182e8cefa8c03f564e55"
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
