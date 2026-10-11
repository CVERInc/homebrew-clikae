class Clikae < Formula
  desc "CLI profile switcher — manage multiple accounts/configs for any CLI"
  homepage "https://github.com/CVERInc/clikae"
  url "https://github.com/CVERInc/clikae/archive/refs/tags/v0.41.0.tar.gz"
  sha256 "949797747afe4efca95c7f131e9e5dad4445ec50e4ea3d170289d2713c1ed9a5"
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
