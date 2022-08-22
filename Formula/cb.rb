class Cb < Formula
  desc "CLI for Crunchy Bridge"
  homepage "https://crunchybridge.com"
  url "https://github.com/CrunchyData/bridge-cli/archive/refs/tags/v2.2.1.tar.gz"
  sha256 "d000403cafdc0c388647aac57eb4d9257586917aebab8bb3088d3bc71789bf92"
  license "GPL-3.0-or-later"

  bottle do
    root_url "https://github.com/CrunchyData/homebrew-brew/releases/download/cb-2.2.1"
    sha256 cellar: :any, arm64_big_sur: "7802cee786010ac0de479c5ea24e61ea225f9a9ef7dadbe26ecbaafe941b159f"
    sha256 cellar: :any, big_sur:       "c576f5e7b0963fbc0c6f37ad66cd95a1b8674123e81abe814e77a29f4d2ef946"
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
