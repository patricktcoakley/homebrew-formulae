class Fgvm < Formula
  desc "Friendly Godot version manager"
  homepage "https://github.com/patricktcoakley/fgvm"
  version "2.5.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/patricktcoakley/fgvm/releases/download/v2.5.0/fgvm-osx-arm64.tar.gz"
      sha256 "10cd4c1c4cda305ada68992319b48a9b85b066753359456519f7c72eb9bcb676"
    end
    on_intel do
      url "https://github.com/patricktcoakley/fgvm/releases/download/v2.5.0/fgvm-osx-x64.tar.gz"
      sha256 "ed3f9a38f957ad8b50ac10759418cce16da067e837bac3bf86d09ad5b4421776"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/patricktcoakley/fgvm/releases/download/v2.5.0/fgvm-linux-arm64.tar.gz"
      sha256 "e603b09c0e3d4a737f6f1fcb7eea044416fa8b4c05a9dc32de054bc5f3096ff9"
    end
    on_intel do
      url "https://github.com/patricktcoakley/fgvm/releases/download/v2.5.0/fgvm-linux-x64.tar.gz"
      sha256 "1775f83195097885e87c84ca261a93f673752a256c1769118abd4946045c3a0c"
    end
  end

  def install
    bin.install "fgvm"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/fgvm --help")
  end
end
