class Cb < Formula
  desc "CLI for Crunchy Bridge"
  homepage "https://crunchybridge.com"
  url "https://github.com/CrunchyData/bridge-cli/archive/refs/tags/v3.4.4.tar.gz"
  sha256 "5c3244023d5d3a4c380d080f488313446ab73a14649e62eaadec353f4a4591d4"
  license "GPL-3.0-or-later"

  head "https://github.com/crunchydata/bridge-cli.git", branch: "main"

  bottle do
    root_url "https://github.com/CrunchyData/homebrew-brew/releases/download/cb-3.4.3"
    sha256 cellar: :any, arm64_monterey: "fa8f5183088a7cbb451505e99a70c068c52cee39c06d239433770e9f910beb2b"
    sha256 cellar: :any, monterey:       "ee62aa10c87b1f7aa5be79999701e9562ac870bf158a5c7bc9d7ed4327b00d45"
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
