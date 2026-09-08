class Fgvm < Formula
  desc "Friendly Godot version manager"
  homepage "https://github.com/patricktcoakley/fgvm"
  version "2.6.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/patricktcoakley/fgvm/releases/download/v2.6.0/fgvm-osx-arm64.tar.gz"
      sha256 "f2d89824f22c1673deede5365adbdf29cddba64eae57c2fb99de1aeec69fb0c2"
    end
    on_intel do
      url "https://github.com/patricktcoakley/fgvm/releases/download/v2.6.0/fgvm-osx-x64.tar.gz"
      sha256 "d99f63a761a7cfca0d1034e71530ac303bd04b3a6093c7ddbdb64010c7351eef"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/patricktcoakley/fgvm/releases/download/v2.6.0/fgvm-linux-arm64.tar.gz"
      sha256 "0c69a39257a525f083f15f01e7e17d4a0bfc531444ff18916090c803793ea333"
    end
    on_intel do
      url "https://github.com/patricktcoakley/fgvm/releases/download/v2.6.0/fgvm-linux-x64.tar.gz"
      sha256 "cd02e3ffb420e1789645ba1123cf7b290985fa8d64a653afeffde9fd11720790"
    end
  end

  def install
    bin.install "fgvm"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/fgvm --help")
  end
end
