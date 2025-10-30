class Cb < Formula
  desc "CLI for Crunchy Bridge"
  homepage "https://crunchybridge.com"
  version "3.6.7"
  license "GPL-3.0-or-later"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/CrunchyData/bridge-cli/releases/download/v#{version}/cb-v#{version}_macos_arm64.zip"
    sha256 "9be8e53e9f679e877384d2708ff5658698e01d844ba1a274008fb3a853b757b7"
  end

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/CrunchyData/bridge-cli/releases/download/v#{version}/cb-v#{version}_macos_amd64.zip"
    sha256 "aae4f0169f56eae77cfa8ccc2b9db1b1bbe214399c05cc6caec491d5fd0f2fa5"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/CrunchyData/bridge-cli/releases/download/v#{version}/cb-v#{version}_linux_aarch64.zip"
    sha256 "1a90f4c4c273959c681e0cb8a1191ca7c86b460d5e3ae2658f3ef5164200f2aa"
  end

  if OS.linux? && Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
    url "https://github.com/CrunchyData/bridge-cli/releases/download/v#{version}/cb-v#{version}_linux_amd64.zip"
    sha256 "55df54a13761c3a3bb36f1bfc7a5d187cb79ea8aff33b621afa423a5cefe2ce9"
  end

  def install
    bin.install "cb"
    # fish_completion.install "completions/cb.fish"
  end

  test do
    assert_match "cb v#{version}", shell_output(bin / "cb version")
  end
end
