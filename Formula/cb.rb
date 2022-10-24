class Cb < Formula
  desc "CLI for Crunchy Bridge"
  homepage "https://crunchybridge.com"
  url "https://github.com/CrunchyData/bridge-cli/archive/refs/tags/v3.0.2.tar.gz"
  sha256 "277b7f0249e09ff022eab752a0b2461f2183f945c09d0594f66dff30cf15a145"
  license "GPL-3.0-or-later"

  bottle do
    root_url "https://github.com/CrunchyData/homebrew-brew/releases/download/cb-3.0.2"
    sha256 cellar: :any, big_sur: "992473779b639f99a104d9fb206a476d3ec48c8c6a0f2fe3bd8c0f6d54b7d46d"
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
