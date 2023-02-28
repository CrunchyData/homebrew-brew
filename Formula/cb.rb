class Cb < Formula
  desc "CLI for Crunchy Bridge"
  homepage "https://crunchybridge.com"
  url "https://github.com/CrunchyData/bridge-cli/archive/refs/tags/v3.2.0.tar.gz"
  sha256 "ee5f575bc8eeb7d2ac5618a53d94d6b0b78ddfd18623c3a65715a344bc650ad7"
  license "GPL-3.0-or-later"

  bottle do
    root_url "https://github.com/CrunchyData/homebrew-brew/releases/download/cb-3.1.0"
    sha256 cellar: :any, arm64_monterey: "ba09a59016190ec6fe4705b23732ff6f34f33f6cac11fa1130c3fb6a4d72c081"
    sha256 cellar: :any, monterey:       "cd2c486026aa22a453a58a449c366d1d809accd4149142ca97c3b605d070d751"
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
