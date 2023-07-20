class Cb < Formula
  desc "CLI for Crunchy Bridge"
  homepage "https://crunchybridge.com"
  url "https://github.com/CrunchyData/bridge-cli/archive/refs/tags/v3.3.3.tar.gz"
  sha256 "4445e585c1ba1de324fed864b5f092ad87a75e72018fc838b23848ed46f15208"
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
  depends_on "openssl@1.1"
  depends_on "pcre2"

  uses_from_macos "zlib"

  patch :p1, <<-EOS
    diff --git a/shard.lock b/shard.lock
    index 3928ff7..7b3f7b0 100644
    --- a/shard.lock
    +++ b/shard.lock
    @@ -1,9 +1,5 @@
     version: 2.0
     shards:
    -  ameba:
    -    git: https://github.com/crystal-ameba/ameba.git
    -    version: 1.3.1
    -
       any_hash:
         git: https://github.com/sija/any_hash.cr.git
         version: 0.2.5
    diff --git a/shard.yml b/shard.yml
    index 2e06d09..1d7e50f 100644
    --- a/shard.yml
    +++ b/shard.yml
    @@ -14,8 +14,6 @@ dependencies:
         github: epoch/tallboy

     development_dependencies:
    -  ameba:
    -    github: crystal-ameba/ameba
       spectator:
         gitlab: arctic-fox/spectator
  EOS

  def install
    system "make", "build", "RELEASE=1"

    bin.install "bin/cb"
    fish_completion.install "completions/cb.fish"
  end

  test do
    assert_match "Usage", shell_output(bin / "cb --help")
  end
end
