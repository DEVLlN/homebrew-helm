class Helm < Formula
  desc "Helm bridge installer and runtime helpers"
  homepage "https://github.com/DEVLlN/helm"
  url "https://github.com/DEVLlN/helm/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "6d3cd5e641f4b4ad982dd73ec2f590ca9017f41bfa135518e410ee89ddff3c6d"
  version "0.2.0"
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
