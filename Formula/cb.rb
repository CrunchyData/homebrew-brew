class Cb < Formula
  desc "CLI for Crunchy Bridge"
  homepage "https://crunchybridge.com"
  url "https://github.com/CrunchyData/bridge-cli/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "9aed8a69cba45d154651bb88210620cddc57cd23de586144e4a65d4dbec55b36"
  license "GPL-3.0-or-later"

  bottle do
    root_url "https://github.com/CrunchyData/homebrew-brew/releases/download/cb-1.0.0"
    sha256 cellar: :any,                     arm64_big_sur: "5d35c5432dc714329fabce26e008e5d67f9c24bb62defd4d0f0ce8a9ac648d8f"
    sha256 cellar: :any,                     big_sur:       "56f9ec94401a718aabc6b856fb19e4328506774dada1f072c1e3ffd79da30483"
    sha256 cellar: :any_skip_relocation,     x86_64_linux:  "fbed0fc8259ee542f935f9b1dfe511adbb1399608ae9139baf844140dbaf649f"
  end

  head do
    url "https://github.com/will/cb.git"
  end

  depends_on "make" => :build
  depends_on "pkg-config" => :build

  depends_on "libevent"
  depends_on "openssl@1.1"
  depends_on "pcre"

  uses_from_macos "zlib"

  on_macos do
    depends_on "bdw-gc"
    depends_on "crystal" => :build
  end

  resource "crystal" do
    on_linux do
      url "https://github.com/crystal-lang/crystal/releases/download/1.0.0/crystal-1.0.0-1-linux-x86_64.tar.gz"
      version "1.0.0-1"
      sha256 "00211ca77758e99210ec40b8c5517b086d2ff9909e089400f6d847a95e5689a4"
    end
  end

  def install
    unless OS.mac?
      # Use static Crystal compiler, since the one in Homebrew seems to be broken
      # for Linux
      (buildpath / "crystal").install resource("crystal")
      ENV.prepend_path "PATH", "crystal/bin"
      ENV.prepend_path "PATH", "crystal/embedded/bin"

      ENV.prepend_path "PKG_CONFIG_PATH", (Formula["readline"].opt_lib / "pkgconfig")
      ENV.prepend_path "PKG_CONFIG_PATH", (Formula["zlib"].opt_lib / "pkgconfig")

      ENV.prepend_path "CRYSTAL_LIBRARY_PATH", (buildpath / "crystal/lib/crystal/lib")
    end
    # system "shards", "build", "--release"
    system "make", "build", "RELEASE=1"

    bin.install "bin/cb"
    fish_completion.install "completions/cb.fish"
  end

  test do
    assert_match "Usage: cb", shell_output(bin / "cb --help")
  end
end
