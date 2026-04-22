class Helm < Formula
  desc "Helm bridge installer and runtime helpers"
  homepage "https://github.com/DEVLlN/helm"
  url "https://codeload.github.com/DEVLlN/helm/tar.gz/refs/tags/v0.1.4"
  sha256 "85fa18c335a418fd386e18c0dc3607b7a7f6d318d5abb00d65d5552851424ec8"
  version "0.1.4"
  license :cannot_represent
  depends_on "node"

  def install
    libexec.install Dir["*"]
    chmod 0755, libexec/"bin/helm.js"
    bin.install_symlink libexec/"bin/helm.js" => "helm"
  end

  test do
    assert_match "Helm CLI", shell_output("#{bin}/helm --help")
    assert_match "platforms", shell_output("#{bin}/helm platforms")
  end
end
