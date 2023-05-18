class Cb < Formula
  desc "CLI for Crunchy Bridge"
  homepage "https://crunchybridge.com"
  url "https://github.com/CrunchyData/bridge-cli/archive/refs/tags/v3.3.3.tar.gz"
  sha256 "4445e585c1ba1de324fed864b5f092ad87a75e72018fc838b23848ed46f15208"
  license "GPL-3.0-or-later"

  bottle do
    root_url "https://github.com/CrunchyData/homebrew-brew/releases/download/cb-3.3.2"
    sha256 cellar: :any, arm64_monterey: "2c2946213f75a5b848d50138f4077d59e15f98a9658a9e8ba0bbac6efbba8e93"
    sha256 cellar: :any, monterey:       "9163d45821961c892ecc706ff174ce7dd10ff5376195a889a0685d3638b59394"
  end

  head do
    url "https://github.com/crunchydata/bridge-cli.git"
  end

  depends_on "crystal" => :build
  depends_on "make" => :build
  depends_on "pkg-config" => :build
  depends_on "bdw-gc"
  depends_on "libevent"
  depends_on "libssh2"
  depends_on "openssl@1.1"
  depends_on "pcre2"

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
