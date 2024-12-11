class Cb < Formula
  desc "CLI for Crunchy Bridge"
  homepage "https://crunchybridge.com"
  version "3.6.2"
  license "GPL-3.0-or-later"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/CrunchyData/bridge-cli/releases/download/v#{version}/cb-v#{version}_macos_arm64.zip"
    sha256 "38a342f1fd499fb78de2324649bb71b199e68a7ba4462b0709554e43e3496b51"
  end

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/CrunchyData/bridge-cli/releases/download/v#{version}/cb-v#{version}_macos_amd64.zip"
    sha256 "255ddef3e50323c949ce5456d1fb7d97b432522d1e1ee42f3479b1003ff772a2"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/CrunchyData/bridge-cli/releases/download/v#{version}/cb-v#{version}_linux_aarch64.zip"
    sha256 "bf02a81ef6f770593912af87c5371b5635e7e2b46da421de00109eb3215d6393"
  end

  if OS.linux? && Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
    url "https://github.com/CrunchyData/bridge-cli/releases/download/v#{version}/cb-v#{version}_linux_amd64.zip"
    sha256 "cc1ec178531cc3b17b2b93894b65e9f66af8367c954099771df5337f7d665988"
  end

  def install
    bin.install "cb"
    # fish_completion.install "completions/cb.fish"
  end

  test do
    assert_match "cb v#{version}", shell_output(bin / "cb version")
  end
end
