class Cb < Formula
  desc "CLI for Crunchy Bridge"
  homepage "https://crunchybridge.com"
  url "https://github.com/CrunchyData/bridge-cli/archive/refs/tags/v3.0.2.tar.gz"
  sha256 "277b7f0249e09ff022eab752a0b2461f2183f945c09d0594f66dff30cf15a145"
  license "GPL-3.0-or-later"

  bottle do
    root_url "https://github.com/CrunchyData/homebrew-brew/releases/download/cb-3.0.1"
    sha256 cellar: :any, arm64_big_sur: "ad996e7130a9bc7eb6fe1bec1a4e6229e67d5aa96019dca0e6444f742004a3ed"
    sha256 cellar: :any, big_sur:       "45a1415d5e953fcc57a422c97b014906f2830aed0ebb8d80e7963e2ecae9c244"
  end

  head do
    url "https://github.com/will/cb.git"
  end

  depends_on "crystal" => :build
  depends_on "make" => :build
  depends_on "pkg-config" => :build
  depends_on "bdw-gc"
  depends_on "libevent"
  depends_on "libssh2"
  depends_on "openssl@1.1"
  depends_on "pcre"

  uses_from_macos "zlib"

  def install
    system "make", "build", "RELEASE=1"

    bin.install "bin/cb"
    fish_completion.install "completions/cb.fish"
  end

  test do
    assert_match "Usage", shell_output(bin / "cb --help")
  end
end
