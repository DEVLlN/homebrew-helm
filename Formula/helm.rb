class Helm < Formula
  desc "Helm bridge installer and runtime helpers"
  homepage "https://github.com/DEVLlN/helm"
  url "https://codeload.github.com/DEVLlN/helm/tar.gz/refs/tags/v0.1.0"
  sha256 "41f919a56bbc5db195c8c9084fb2f205fd18c6f92edd90d04c169845fbb13439"
  version "0.1.0"
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
