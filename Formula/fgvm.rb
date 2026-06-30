class Fgvm < Formula
  desc "Friendly Godot version manager"
  homepage "https://github.com/patricktcoakley/fgvm"
  version "2.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/patricktcoakley/fgvm/releases/download/v2.3.0/fgvm-osx-arm64.tar.gz"
      sha256 "9223c5f7d3c6eb93df68d01fdf56833282ae4f50f2e1cec3548652e7659c1e66"
    end
    on_intel do
      url "https://github.com/patricktcoakley/fgvm/releases/download/v2.3.0/fgvm-osx-x64.tar.gz"
      sha256 "edf35a0f262ffab934c73e4a13b8f3cf718843c78adafb106817dbc00e9073c0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/patricktcoakley/fgvm/releases/download/v2.3.0/fgvm-linux-arm64.tar.gz"
      sha256 "b58c52d7301e3de011c85449ac63b313939a501f0a6b6724fde78d048f70a345"
    end
    on_intel do
      url "https://github.com/patricktcoakley/fgvm/releases/download/v2.3.0/fgvm-linux-x64.tar.gz"
      sha256 "e88c7fa397621dd7bbee06d79e83cdd301e548ca8fbf138aa31033c8eece744d"
    end
  end

  def install
    bin.install "fgvm"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/fgvm --help")
  end
end
