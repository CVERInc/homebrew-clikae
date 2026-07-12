class Clikae < Formula
  desc "CLI profile switcher — manage multiple accounts/configs for any CLI"
  homepage "https://github.com/CVERInc/clikae"
  url "https://github.com/CVERInc/clikae/archive/refs/tags/v0.14.3.tar.gz"
  sha256 "2099d70d03685cc9eeab4613b51f6aaca426d86b3e183ccc2f3a825b9d530ee0"
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
