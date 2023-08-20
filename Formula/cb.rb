class Cb < Formula
  desc "CLI for Crunchy Bridge"
  homepage "https://crunchybridge.com"
  url "https://github.com/crunchydata/bridge-cli/archive/refs/tags/v3.4.0.tar.gz"
  sha256 "004e8f46a7ba279c998d24ed781bf945dd71af087e4a4581dfbd8e933bb94341"
  license "GPL-3.0-or-later"

  bottle do
    root_url "https://github.com/CrunchyData/homebrew-brew/releases/download/cb-3.4.0"
    sha256 cellar: :any, arm64_monterey: "c8f2a246adebe429a31e5f101f5a5e1374135d4b99b809fd9c3858e6c1aba562"
    sha256 cellar: :any, monterey:       "409c3efba0da80a07c5748f5cf3def387bfefe19ca389e0b10265d92d8a8dc8c"
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
