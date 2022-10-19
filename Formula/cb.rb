class Cb < Formula
  desc "CLI for Crunchy Bridge"
  homepage "https://crunchybridge.com"
  url "https://github.com/CrunchyData/bridge-cli/archive/refs/tags/v3.0.1.tar.gz"
  sha256 "1fb8c8f41aafb6ba6ed34f2366c387f25f5bac067f332747c97fca4c0ef34c8d"
  license "GPL-3.0-or-later"

  bottle do
    root_url "https://github.com/CrunchyData/homebrew-brew/releases/download/cb-3.0.0"
    sha256 cellar: :any, arm64_big_sur: "9c2685317500bb1c1cc8e97f832633c446f77c944092931ec328eaacdd3b90d8"
    sha256 cellar: :any, big_sur:       "f41b0550f0956149d17e8792b88ca076eb793099598149fc4ef6450dd1809a8d"
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
