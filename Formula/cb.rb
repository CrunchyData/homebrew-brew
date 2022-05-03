class Cb < Formula
  desc "CLI for Crunchy Bridge"
  homepage "https://crunchybridge.com"
  url "https://github.com/CrunchyData/bridge-cli/archive/refs/tags/v1.3.0.tar.gz"
  sha256 "9abda6a167ab46a93e0ac5724465f1793b56d21c5269074d058d1b2987b03544"
  license "GPL-3.0-or-later"

  bottle do
    root_url "https://github.com/CrunchyData/homebrew-brew/releases/download/cb-1.2.0"
    sha256 cellar: :any,                     arm64_big_sur: "ddd902b33a66f42052f4144a4f93c64e8cdd342f62eaa6f02552a637f9a9bc1d"
    sha256 cellar: :any,                     big_sur:       "9c02c7bdabf242e919e9bc2b55e0aa97fb0d2dd51143e78a2880c002735fc42a"
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
