class DnsHeaven < Formula
  desc "Fixes stupid macOS DNS stack (/etc/resolv.conf)"
  homepage "https://github.com/jduepmeier/dns-heaven"
  version "1.1.0"

  if OS.mac?
    url "https://github.com/jduepmeier/dns-heaven/releases/download/v1.1.0/dns-heaven_Darwin_x86_64.tar.gz"
    sha256 "a3570d4544f066991b03047dc74139b4df2af9987f536ee4170856eb2429735d"
  elsif OS.linux?
  end
  
  depends_on "go"

  def install
    bin.install "dns-heaven"
  end

  plist_options :startup => false

  def plist; <<~EOS
    <?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>Label</key>
    <string>com.greenboxal.dnsheaven</string>
    <key>ProgramArguments</key>
    <array>
        <string>#{bin}/dns-heaven</string>
    </array>
    <key>KeepAlive</key>
    <true/>
    <key>RunAtLoad</key>
    <true/>
</dict>
</plist>

  EOS
  end

  test do
    system "#{bin}/dns-heaven -version"
  end
end
