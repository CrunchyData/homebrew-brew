class Cb < Formula
  desc "CLI for Crunchy Bridge"
  homepage "https://crunchybridge.com"
  version "3.6.1"
  license "GPL-3.0-or-later"

  bottle do
    root_url "https://github.com/CrunchyData/homebrew-brew/releases/download/cb-3.6.1"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "02444b3f92eabda525c77905095ed002f6a9486b93b07b197222872c40d5feec"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/CrunchyData/bridge-cli/releases/download/v#{version}/cb-v#{version}_macos_arm64.zip"
    sha256 "b0c52dbe6cc9ddcaf2c278bac2849e93f1e48f7bde575eb7e831a35fe8ff7848"
  end

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/CrunchyData/bridge-cli/releases/download/v#{version}/cb-v#{version}_macos_amd64.zip"
    sha256 "3ffaaeac54d32b33b25c1f89996cbdde8cc81fe6dfc35737f960b648f62397a5"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/CrunchyData/bridge-cli/releases/download/v#{version}/cb-v#{version}_linux_aarch64.zip"
    sha256 "a4513c5fee5de1d2e2aad373bd45243f2ae783eee5f708b8c9492fe955c163c2"
  end

  if OS.linux? && Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
    url "https://github.com/CrunchyData/bridge-cli/releases/download/v#{version}/cb-v#{version}_linux_amd64.zip"
    sha256 "1c3bfcbdb09228b4b2fe55dfc52caf0fc5b517da763f2ea2fd51f4ba402ff92c"
  end

  def install
    bin.install "cb"
    # fish_completion.install "completions/cb.fish"
  end

  test do
    assert_match "cb v#{version}", shell_output(bin / "cb version")
  end
end
