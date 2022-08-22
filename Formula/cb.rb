class Cb < Formula
  desc "CLI for Crunchy Bridge"
  homepage "https://crunchybridge.com"
  url "https://github.com/CrunchyData/bridge-cli/archive/refs/tags/v2.2.1.tar.gz"
  sha256 "d000403cafdc0c388647aac57eb4d9257586917aebab8bb3088d3bc71789bf92"
  license "GPL-3.0-or-later"

  bottle do
    root_url "https://github.com/CrunchyData/homebrew-brew/releases/download/cb-2.2.0"
    sha256 cellar: :any, arm64_big_sur: "966690c93279c56f2e824ce3b825185e16c8e7dfaab4939a06ae662bbf2b30fa"
    sha256 cellar: :any, big_sur:       "cc779d084bf8bd9cf335f56d3475f804cac6659d2701a1faf733ac0b404e3718"
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
