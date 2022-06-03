class Cb < Formula
  desc "CLI for Crunchy Bridge"
  homepage "https://crunchybridge.com"
  url "https://github.com/CrunchyData/bridge-cli/archive/refs/tags/v2.1.0.tar.gz"
  sha256 "1198465f07dc3d02425de7b81ee9296df1c56fe284f3ae5cafb2065b40dcec46"
  license "GPL-3.0-or-later"

  bottle do
    root_url "https://github.com/CrunchyData/homebrew-brew/releases/download/cb-2.0.0"
    sha256 cellar: :any, arm64_big_sur: "ed47d5ee9a28de62029c504d8a68475ab87dd4dfc2c26218263aef799530daef"
    sha256 cellar: :any, big_sur:       "dbcdfc0847c83e7c469153230a14e8a6578ceb208d78c58707db8e0cb2dad5df"
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
