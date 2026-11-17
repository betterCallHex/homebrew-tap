class PressureGuard < Formula
  desc "Keeps a Mac responsive while many coding agents run, without limiting them"
  homepage "https://github.com/betterCallHex/pressure-guard"
  url "https://github.com/betterCallHex/pressure-guard/archive/refs/tags/v0.5.0.tar.gz"
  sha256 "8ea7865b78d81690b410763cd13d607590a551acbaa272a7ffa700158e302803"

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on "rust" => :build
  depends_on :macos

  def install
    system "cargo", "install", *std_cargo_args
    pkgshare.install "config.example.toml"
  end

  def caveats
    <<~EOS
      Optional settings: copy #{opt_pkgshare}/config.example.toml
      to ~/.config/pressure-guard/config.toml, then run
        brew services restart pressure-guard
    EOS
  end

  service do
    run opt_bin/"pressure-guard"
    keep_alive true
    process_type :interactive
    log_path var/"log/pressure-guard.log"
    error_log_path var/"log/pressure-guard.log"
  end

  test do
    log = testpath/"pressure-guard.log"
    pid = spawn bin/"pressure-guard", "--dry-run", out: log.to_s
    sleep 3
    Process.kill("TERM", pid)
    Process.wait(pid)
    assert_match "stopped, every process restored", log.read
  end
end
