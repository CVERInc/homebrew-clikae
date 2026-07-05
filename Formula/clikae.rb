class Clikae < Formula
  desc "CLI profile switcher — manage multiple accounts/configs for any CLI"
  homepage "https://github.com/CVERInc/clikae"
  url "https://github.com/CVERInc/clikae/archive/refs/tags/v0.11.0.tar.gz"
  sha256 "dda107dc0236879457942c66f84bf360b673b05352ba3871943b0ca5aebeede6"
  license "MIT"
  head "https://github.com/CVERInc/clikae.git", branch: "main"

  def install
    libexec.install "bin", "lib"
    libexec.install "assets" if File.directory?("assets") # welcome-screen logo
    (bin/"clikae").write <<~SH
      #!/usr/bin/env bash
      exec "#{libexec}/bin/clikae" "$@"
    SH
    chmod 0755, bin/"clikae"

    pkgshare.install "README.md", "CHANGELOG.md", "LICENSE"
  end

  test do
    assert_match "clikae", shell_output("#{bin}/clikae version")
    assert_match "adapters", shell_output("#{bin}/clikae help")
  end
end
