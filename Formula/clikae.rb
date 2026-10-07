class Clikae < Formula
  desc "CLI profile switcher — manage multiple accounts/configs for any CLI"
  homepage "https://github.com/CVERInc/clikae"
  url "https://github.com/CVERInc/clikae/archive/refs/tags/v0.40.0.tar.gz"
  sha256 "6261d10b0bdbcf3ea6b2a0fefe7e775dabf6ba21e83589321e5ecb233ef689e5"
  license "MIT"
  head "https://github.com/CVERInc/clikae.git", branch: "main"

  depends_on "jq"

  def install
    libexec.install "bin", "lib", "templates"
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
