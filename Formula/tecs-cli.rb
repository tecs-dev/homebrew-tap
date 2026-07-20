# Installs the prebuilt Tecs CLI: a launcher script plus a self-contained
# LÖVE application payload. The launcher downloads the LÖVE 12 runtime into
# the user cache on first run; no Lua toolchain is required.
class TecsCli < Formula
  desc "Create, check, build, and run Tecs2D game projects"
  homepage "https://github.com/tecs-dev/tecs"
  url "https://github.com/tecs-dev/tecs/releases/download/v0.10.10/tecs-cli-0.10.10.tar.gz"
  sha256 "777a551643b029ea1d93101530100c104641e2c22d0d26f63a6c742d86eced83"
  license "MIT"

  def install
    # The launcher resolves symlinks and finds tecs-cli.love beside itself.
    libexec.install "tecs", "tecs-cli.love"
    bin.install_symlink libexec/"tecs"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tecs --version")
  end
end
