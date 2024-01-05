class Cb < Formula
  desc "CLI for Crunchy Bridge"
  homepage "https://crunchybridge.com"
  url "https://github.com/CrunchyData/bridge-cli/archive/refs/tags/v3.4.2.tar.gz"
  sha256 "614567ced05cb3f5fb730e5700e902e596390997af88807cde6542b91d171f91"
  license "GPL-3.0-or-later"

  bottle do
    root_url "https://github.com/CrunchyData/homebrew-brew/releases/download/cb-3.4.1"
    sha256 cellar: :any, arm64_monterey: "b55b097c852bc1681d7c4308b32ba137e5e1c81c21f590e46539eccb0e02e4a4"
    sha256 cellar: :any, monterey:       "2862a7880ddb358c3b7cd52d91d2ded0c4dfd808a1f5f1af0bbc93142490ff10"
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
