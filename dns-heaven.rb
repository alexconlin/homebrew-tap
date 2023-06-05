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
  
  service do
    run "#{bin}/dns-heaven"
    require_root true
    keep_alive true
    log_path var/"log/dns-heaven/stdout.log"
    error_log_path var/"log/dns-heaven/stderr.log"
  end

  test do
    system "#{bin}/dns-heaven -version"
  end
end
