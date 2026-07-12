# Installs the prebuilt Tecs CLI: a launcher script plus a self-contained
# LÖVE application payload. The launcher downloads the LÖVE 12 runtime into
# the user cache on first run; no Lua toolchain is required.
class TecsCli < Formula
  desc "Create, check, build, and run Tecs2D game projects"
  homepage "https://github.com/tecs-dev/tecs-cli"
  version "0.1.0"
  url "https://github.com/tecs-dev/tecs-cli/releases/download/v0.1.0/tecs"
  sha256 "7aa977f11be5d6be28ecc02df93cdcb226fbd0ecaf63ea608d2937b2e576d4dd"
  license "MIT"

  resource "payload" do
    url "https://github.com/tecs-dev/tecs-cli/releases/download/v0.1.0/tecs-cli.love"
    sha256 "9e693b6f0dfc8de8f91500f9aacf7d6e1cb8fefd6a2b9490ccbda9b871534152"
  end

  def install
    libexec.install "tecs"
    resource("payload").stage { libexec.install "tecs-cli.love" }
    # The v0.1.0 launcher looks for the payload beside $0 without resolving
    # symlinks, so point it at the payload explicitly. From v0.2.0 this can
    # become a plain bin.install_symlink of the versioned release tarball.
    (bin/"tecs").write_env_script libexec/"tecs", TECS_CLI_LOVE: libexec/"tecs-cli.love"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tecs --version")
  end
end
