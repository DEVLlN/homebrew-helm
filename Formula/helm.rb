class Helm < Formula
  desc "Helm bridge installer and runtime helpers"
  homepage "https://github.com/DEVLlN/helm"
  url "https://github.com/DEVLlN/helm/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "f0dac483ec62f834da5e062d9dfe3a8926718de2e22cd663360e866edaab5746"
  version "0.3.0"
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
