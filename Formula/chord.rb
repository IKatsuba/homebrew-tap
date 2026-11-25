class Chord < Formula
  desc "Full-screen terminal client for ACP coding agents"
  homepage "https://github.com/IKatsuba/chord"
  version "0.72.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/IKatsuba/chord/releases/download/v0.72.0/chord-darwin-arm64.tar.gz"
      sha256 "10ca093e003d8227efca6d4188dae4248409577c0de3162d755b7ab250cb1cf2"
    end
    on_intel do
      url "https://github.com/IKatsuba/chord/releases/download/v0.72.0/chord-darwin-x64.tar.gz"
      sha256 "e629e189c87d013b04776b8077918a6e3e60d6c82b956b48f64aa8cc3cee7465"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/IKatsuba/chord/releases/download/v0.72.0/chord-linux-arm64.tar.gz"
      sha256 "ee0e10f3ea901ae20a3c2c5ce91fbebb53cbe1ff212f4891e9098393c1939f01"
    end
    on_intel do
      url "https://github.com/IKatsuba/chord/releases/download/v0.72.0/chord-linux-x64.tar.gz"
      sha256 "650975e037a6339c0cb954b63d28b33686022c992d4b8c7a6f22857324a6a818"
    end
  end

  def install
    bin.install "chord"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/chord --version")
  end
end
