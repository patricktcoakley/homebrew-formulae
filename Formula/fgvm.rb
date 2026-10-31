class Fgvm < Formula
  desc "Friendly Godot version manager"
  homepage "https://github.com/patricktcoakley/fgvm"
  version "2.6.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/patricktcoakley/fgvm/releases/download/v2.6.1/fgvm-osx-arm64.tar.gz"
      sha256 "f21608a979e9969b1b975523119c9a0b933b4a2fcef0bd56147e01d5f4bf079e"
    end
    on_intel do
      url "https://github.com/patricktcoakley/fgvm/releases/download/v2.6.1/fgvm-osx-x64.tar.gz"
      sha256 "e4e87dbff6edf291043b1713722a94cf69763469e5f52cfedbc689a2f22e24ac"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/patricktcoakley/fgvm/releases/download/v2.6.1/fgvm-linux-arm64.tar.gz"
      sha256 "f3eeee431c91cec65dc13a6a433c602da2c6ed7aa083b7347cecdab2151f0b16"
    end
    on_intel do
      url "https://github.com/patricktcoakley/fgvm/releases/download/v2.6.1/fgvm-linux-x64.tar.gz"
      sha256 "f3e73995e0f7ff3ca1801c3f88072e4d8881f5efc75e43b980bc78161c9ba7d3"
    end
  end

  def install
    bin.install "fgvm"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/fgvm --help")
  end
end
