class Fgvm < Formula
  desc "Friendly Godot version manager"
  homepage "https://github.com/patricktcoakley/fgvm"
  version "2.4.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/patricktcoakley/fgvm/releases/download/v2.4.0/fgvm-osx-arm64.tar.gz"
      sha256 "9a277e5466b63486faabfc3ffd4e128f79e29f7db1814c77050923320ea878f0"
    end
    on_intel do
      url "https://github.com/patricktcoakley/fgvm/releases/download/v2.4.0/fgvm-osx-x64.tar.gz"
      sha256 "627e1f8e609f2cdbdedffb7976d53e02b95a133f4c9b805d21c8fef7ea58ce9e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/patricktcoakley/fgvm/releases/download/v2.4.0/fgvm-linux-arm64.tar.gz"
      sha256 "236ea5a90879f5a5f44e46ff89df5df5cdbee8be6dcc781aafcb15f75c054cf0"
    end
    on_intel do
      url "https://github.com/patricktcoakley/fgvm/releases/download/v2.4.0/fgvm-linux-x64.tar.gz"
      sha256 "0ddddc10cf96460db427aa2e5cea66ed7f147602aa8edffb675e22e4d93dc471"
    end
  end

  def install
    bin.install "fgvm"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/fgvm --help")
  end
end
