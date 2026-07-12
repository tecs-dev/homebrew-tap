# Installs the prebuilt Tecs CLI: a launcher script plus a self-contained
# LÖVE application payload. The launcher downloads the LÖVE 12 runtime into
# the user cache on first run; no Lua toolchain is required.
class TecsCli < Formula
  desc "Create, check, build, and run Tecs2D game projects"
  homepage "https://github.com/tecs-dev/tecs-cli"
  url "https://github.com/tecs-dev/tecs-cli/releases/download/v0.6.0/tecs-cli-0.6.0.tar.gz"
  sha256 "adc36e9b60799d7533e7730ed65f8e4e4f098b6fb1d52aaa5f0a404569e000c9"
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
