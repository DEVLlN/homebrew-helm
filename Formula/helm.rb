class Helm < Formula
  desc "Helm bridge installer and runtime helpers"
  homepage "https://github.com/DEVLlN/helm"
  url "https://codeload.github.com/DEVLlN/helm/tar.gz/refs/tags/v0.1.3"
  sha256 "c1191cb17d599834258b1aae3168d114e2bd1a63f1187706427dd3d4ff70cd92"
  version "0.1.3"
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
