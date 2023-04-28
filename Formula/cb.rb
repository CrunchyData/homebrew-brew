class Cb < Formula
  desc "CLI for Crunchy Bridge"
  homepage "https://crunchybridge.com"
  url "https://github.com/CrunchyData/bridge-cli/archive/refs/tags/v3.3.0.tar.gz"
  sha256 "a80644f7bb83735320bba14914eee7a769363aa12a8b40ec9c92b43687210a26"
  license "GPL-3.0-or-later"

  bottle do
    root_url "https://github.com/CrunchyData/homebrew-brew/releases/download/cb-3.2.0"
    sha256 cellar: :any, arm64_monterey: "1b9b9dfcde822169ca078088876916a76caf43c7fe86e4dd3abb782a2bc2b217"
    sha256 cellar: :any, monterey:       "fa63d9a316e8cb93c46ec7712baec824d15ee2f5af28d237010637a9c36c4045"
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
