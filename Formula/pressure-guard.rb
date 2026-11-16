class PressureGuard < Formula
  desc "Slows macOS background services under memory pressure or heat, never your apps"
  homepage "https://github.com/betterCallHex/pressure-guard"
  url "https://github.com/betterCallHex/pressure-guard/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "8ec7c27b3a05471f9295fa5c2400f2be94b33b4a601da41f4a9aa756784d1491"

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
