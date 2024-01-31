class Cb < Formula
  desc "CLI for Crunchy Bridge"
  homepage "https://crunchybridge.com"
  url "https://github.com/CrunchyData/bridge-cli/archive/refs/tags/v3.5.0.tar.gz"
  sha256 "a076c8dfae202e8e52e21cc3571ce6580b36a5505e722b1e9ec06a5136c54a34"
  license "GPL-3.0-or-later"

  head "https://github.com/crunchydata/bridge-cli.git", branch: "main"

  bottle do
    root_url "https://github.com/CrunchyData/homebrew-brew/releases/download/cb-3.5.0"
    sha256 cellar: :any, arm64_monterey: "6b382d22ba8886c4e53f052ed714509a4d7335f110dd3601681f75efd1cc75a2"
    sha256 cellar: :any, monterey:       "07ffc0a275bd5f08f791f0d507012bc2a255e3a08d5f1726a4dce946495b16f1"
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
