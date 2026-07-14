# Installs the prebuilt Tecs CLI: a launcher script plus a self-contained
# LÖVE application payload. The launcher downloads the LÖVE 12 runtime into
# the user cache on first run; no Lua toolchain is required.
class TecsCli < Formula
  desc "Create, check, build, and run Tecs2D game projects"
  homepage "https://github.com/tecs-dev/tecs-cli"
  url "https://github.com/tecs-dev/tecs-cli/releases/download/v0.10.4/tecs-cli-0.10.4.tar.gz"
  sha256 "9ed90b72ba73893fef0bb419e4becec40fb12587c9c5b0804e198d7a5397c517"
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
