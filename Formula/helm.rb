class Helm < Formula
  desc "Helm bridge installer and runtime helpers"
  homepage "https://github.com/DEVLlN/helm"
  url "https://github.com/DEVLlN/helm/archive/refs/tags/v0.2.1.tar.gz"
  sha256 "a8dd831a193ee027513b07344c03a0499c474c747341dcac7d5bd5b20763c7dd"
  version "0.2.1"
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
