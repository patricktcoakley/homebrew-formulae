class Fgvm < Formula
  desc "Friendly Godot version manager"
  homepage "https://github.com/patricktcoakley/fgvm"
  license "MIT"
  version "2.2.0"

  on_macos do
    on_arm do
      url "https://github.com/patricktcoakley/fgvm/releases/download/v2.2.0/fgvm-osx-arm64.tar.gz"
      sha256 "e378ac20d88735def08bd0cda3ac183b425c27e92fd5b037ff6f0235d1d480d2"
    end
    on_intel do
      url "https://github.com/patricktcoakley/fgvm/releases/download/v2.2.0/fgvm-osx-x64.tar.gz"
      sha256 "e12d0063e49cc189526a7f534063f88812b7990bffb081a5f993fa13ed4bf95e"
    end
  end

  def install
    bin.install "fgvm"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/fgvm --help")
  end
end
