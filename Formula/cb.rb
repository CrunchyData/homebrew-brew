class Cb < Formula
  desc "CLI for Crunchy Bridge"
  homepage "https://crunchybridge.com"
  url "https://github.com/crunchydata/bridge-cli/archive/refs/tags/v3.4.0.tar.gz"
  sha256 "004e8f46a7ba279c998d24ed781bf945dd71af087e4a4581dfbd8e933bb94341"
  license "GPL-3.0-or-later"

  bottle do
    root_url "https://github.com/CrunchyData/homebrew-brew/releases/download/cb-3.3.3"
    sha256 cellar: :any, arm64_monterey: "4aca16bdd1a9c5687231f4c820d4f11c7cb54275ec89e75e8f3cda02cb68772a"
    sha256 cellar: :any, monterey:       "ad9fc61adc7fc6b00301bb223c563c44d58e1dac6ae10a44a2878f67ea550bc8"
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
