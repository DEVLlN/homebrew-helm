class Helm < Formula
  desc "Helm bridge installer and runtime helpers"
  homepage "https://github.com/DEVLlN/helm"
  url "https://codeload.github.com/DEVLlN/helm/tar.gz/refs/tags/v0.1.2"
  sha256 "de62ee3662f02f11b75003b23b6f9adbb835c1996111d10cf3260adb7b6c7a2f"
  version "0.1.2"
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
