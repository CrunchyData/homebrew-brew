#!/usr/bin/env ruby
# frozen_string_literal: true

ver = ARGV[0]
p ver

static_mac_x86 = "https://github.com/CrunchyData/bridge-cli/releases/download/v#{ver}/cb-v#{ver}_macos_amd64.zip"
bottle_mac_x86 = "https://github.com/CrunchyData/homebrew-brew/releases/download/cb-#{ver}/cb-#{ver}.big_sur.bottle.tar.gz"

module Ok
  def `(cmd)
    puts cmd
    super
  end
end
# include Ok

`rm -rf scratch`
`mkdir -p scratch`
Dir.chdir "scratch"
`curl -L #{static_mac_x86} > static.zip`
`curl -L #{bottle_mac_x86} > bottle.tgz`

`unzip -o static.zip`
`rm static.zip`
`mv cb binary`
`tar xzvf bottle.tgz`
`rm bottle.tgz`
`rm -rf cb/#{ver}/bin/cb`
`mv binary cb/#{ver}/bin/cb`
`chmod -w cb/#{ver}/bin/cb`
`tar cvzf cb-#{ver}.arm64_big_sur.bottle.tar.gz cb`
`rm -rf cb`
sha = `sha256sum cb-#{ver}.arm64_big_sur.bottle.tar.gz`.split.first

Dir.chdir ".."
`sed -i '10i\\ \
sha256 cellar: :any, arm64_big_sur: "#{sha}"
' Formula/cb.rb`
p `brew style --fix Formula/cb.rb`
p `brew audit --formula Formula/cb.rb`
