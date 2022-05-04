class Cb < Formula
  desc "CLI for Crunchy Bridge"
  homepage "https://crunchybridge.com"
  url "https://github.com/CrunchyData/bridge-cli/archive/refs/tags/v1.3.0.tar.gz"
  sha256 "9abda6a167ab46a93e0ac5724465f1793b56d21c5269074d058d1b2987b03544"
  license "GPL-3.0-or-later"

  bottle do
    root_url "https://github.com/CrunchyData/homebrew-brew/releases/download/cb-1.3.0"
    sha256 cellar: :any, arm64_big_sur: "3d8f86c8add7c334fcf24efc36899329f25b72c3b155735580f3fccfcdddf205"
    sha256 cellar: :any, big_sur:       "381b31faec51aefef133d8984820c0816f75b1bb4df5e1a93cd64e47810c5dde"
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
