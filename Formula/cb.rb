class Cb < Formula
  desc "CLI for Crunchy Bridge"
  homepage "https://crunchybridge.com"
  url "https://github.com/CrunchyData/bridge-cli/archive/refs/tags/v3.4.3.tar.gz"
  sha256 "6ae15ad6d6fa394e4ca1f4d119171a99e4b5e4dc6f5f07995c376d5bc6c81bee"
  license "GPL-3.0-or-later"

  bottle do
    root_url "https://github.com/CrunchyData/homebrew-brew/releases/download/cb-3.4.2"
    sha256 cellar: :any, arm64_monterey: "481d56734225443e17383802f53cdb1d350ed177feaaa6eb5a61f6c48afca0f6"
    sha256 cellar: :any, monterey:       "f6bc990e70b1abc47100241042ac81b782c53d4818f42d729e5fa71e0dccbada"
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
  depends_on "openssl@3"
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
