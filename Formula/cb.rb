class Cb < Formula
  desc "CLI for Crunchy Bridge"
  homepage "https://crunchybridge.com"
  version "3.6.0"
  license "GPL-3.0-or-later"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/CrunchyData/bridge-cli/releases/download/v#{version}/cb-v#{version}_macos_arm64.zip"
    sha256 "42f62809bb76232ad098bfa3d817259270830fd23fde8457f4cb6efb8a2564a3"
  end

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/CrunchyData/bridge-cli/releases/download/v#{version}/cb-v#{version}_macos_amd64.zip"
    sha256 "6fea519db4d9a0e6f432f4ee52da96c22777eaacb67f034eaa7bd4b1c98591e3"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/CrunchyData/bridge-cli/releases/download/v#{version}/cb-v#{version}_linux_aarch64.zip"
    sha256 "66d3ec655b6d6ff7bbefc545be343d7ea731138bbc1e9cbe57e1e1d105aaea7a"
  end

  if OS.linux? && Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
    url "https://github.com/CrunchyData/bridge-cli/releases/download/v#{version}/cb-v#{version}_linux_amd64.zip"
    sha256 "c5b90af19ebb91cd7f209c0ab67a749c15468df7568709873767a79fc5f42900"
  end

  def install
    bin.install "cb"
    # fish_completion.install "completions/cb.fish"
  end

  test do
    assert_match "cb v#{version}", shell_output(bin / "cb version")
  end
end
