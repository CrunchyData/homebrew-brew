class Cb < Formula
  desc "CLI for Crunchy Bridge"
  homepage "https://crunchybridge.com"
  url "https://github.com/CrunchyData/bridge-cli/archive/refs/tags/v3.3.2.tar.gz"
  sha256 "95abb452d6ba6b6f3515782ea860a6a5b8e921b8cf628d80ccd334b4272626c4"
  license "GPL-3.0-or-later"

  bottle do
    root_url "https://github.com/CrunchyData/homebrew-brew/releases/download/cb-3.3.0"
    sha256 cellar: :any, arm64_monterey: "7c124f659e4448117ccc17e8bbc6117e2a3be82fc926aa23e91c936fa65ba2d1"
    sha256 cellar: :any, monterey:       "e38044b01b86ea3cac6a29474c11e7edd765fcbbecc1e35489f9c9061b244b39"
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
