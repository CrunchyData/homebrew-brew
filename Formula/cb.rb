class Cb < Formula
  desc "CLI for Crunchy Bridge"
  homepage "https://crunchybridge.com"
  version "3.6.6"
  license "GPL-3.0-or-later"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/CrunchyData/bridge-cli/releases/download/v#{version}/cb-v#{version}_macos_arm64.zip"
    sha256 "5d2e7b5513056f7fb5834aa9825a115dabb6ad4d37a1263e26f5673a16bf08b9"
  end

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/CrunchyData/bridge-cli/releases/download/v#{version}/cb-v#{version}_macos_amd64.zip"
    sha256 "1dd1ffe66129d06c02fbf8c0c2770ca000e08a7bc03e307437cfd568f3fa5191"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/CrunchyData/bridge-cli/releases/download/v#{version}/cb-v#{version}_linux_aarch64.zip"
    sha256 "5a58a4e34c6c2d85a4719bb256441eae41606cb427fad1391aa1a54e8156d1ea"
  end

  if OS.linux? && Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
    url "https://github.com/CrunchyData/bridge-cli/releases/download/v#{version}/cb-v#{version}_linux_amd64.zip"
    sha256 "77fa6dd285aa9f1a38b17ffcae6b9b66c5b6bb09330e038bf3de1a98b6ca4396"
  end

  def install
    bin.install "cb"
    # fish_completion.install "completions/cb.fish"
  end

  test do
    assert_match "cb v#{version}", shell_output(bin / "cb version")
  end
end
