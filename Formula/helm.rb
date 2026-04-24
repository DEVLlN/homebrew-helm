class Helm < Formula
  desc "Helm bridge installer and runtime helpers"
  homepage "https://github.com/DEVLlN/helm"
  url "https://github.com/DEVLlN/helm/archive/refs/tags/v0.1.5.tar.gz"
  sha256 "b8a14e70ff78bf78fcf7a301c5c610443641332bee3453207b6521939e000b82"
  version "0.1.5"
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
