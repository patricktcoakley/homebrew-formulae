class Fgvm < Formula
  desc "Friendly Godot version manager"
  homepage "https://github.com/patricktcoakley/fgvm"
  url "https://github.com/patricktcoakley/fgvm/archive/refs/tags/v2.1.1.tar.gz"
  sha256 "e93b34665a1ac189a0336bfa255b4dc54753b72312c7e54c3036062832932972"
  license "MIT"
  head "https://github.com/patricktcoakley/fgvm.git", branch: "main"

  depends_on "mise" => :build

  def install
    ENV["DOTNET_CLI_TELEMETRY_OPTOUT"] = "true"
    ENV["DOTNET_CLI_HOME"] = (buildpath / ".dotnet").to_s
    ENV["MISE_CACHE_DIR"] = (buildpath / ".cache/mise").to_s
    ENV["MISE_CONFIG_DIR"] = (buildpath / ".config/mise").to_s
    ENV["MISE_DATA_DIR"] = (buildpath / ".mise").to_s
    ENV["MISE_STATE_DIR"] = (buildpath / ".state/mise").to_s
    ENV["MISE_YES"] = "1"

    system "mise", "trust", "--yes", "--quiet", "mise.toml"
    system "mise", "install", "--yes", "dotnet"
    system "mise", "exec", "--yes", "dotnet", "--",
           "dotnet", "publish", "Fgvm.Cli",
           "-c", "Release",
           "--output", buildpath / "output"

    bin.install buildpath / "output/fgvm"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/fgvm --help")
  end
end
