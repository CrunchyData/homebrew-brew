class Cb < Formula
  desc "CLI for Crunchy Bridge"
  homepage "https://crunchybridge.com"
  version "3.6.5"
  license "GPL-3.0-or-later"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/CrunchyData/bridge-cli/releases/download/v#{version}/cb-v#{version}_macos_arm64.zip"
    sha256 "a59d5f799d8a191c6d90618d42dc6ead0fd98fabd9b723e90d298d12f28449c2"
  end

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/CrunchyData/bridge-cli/releases/download/v#{version}/cb-v#{version}_macos_amd64.zip"
    sha256 "bdf3e640f2f220c79069235969b7bba5271aa42a4c3f872430cc86e37a68fad9"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/CrunchyData/bridge-cli/releases/download/v#{version}/cb-v#{version}_linux_aarch64.zip"
    sha256 "c5276eabf8c5a09a6a5d69ed627701c178f7a2086b2afbd010110ab683f253b9"
  end

  if OS.linux? && Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
    url "https://github.com/CrunchyData/bridge-cli/releases/download/v#{version}/cb-v#{version}_linux_amd64.zip"
    sha256 "2a03366a746a739f1c351fc7b060ce91575085896605f2d7db4d88b690a01214"
  end

  def install
    bin.install "cb"
    # fish_completion.install "completions/cb.fish"
  end

  test do
    assert_match "cb v#{version}", shell_output(bin / "cb version")
  end
end
