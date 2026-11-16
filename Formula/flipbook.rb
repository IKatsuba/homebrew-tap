class Flipbook < Formula
  desc "Videos from SwiftUI views, every frame a pure function of its number"
  homepage "https://github.com/IKatsuba/flipbook"
  url "https://github.com/IKatsuba/flipbook/archive/refs/tags/1.1.0.tar.gz"
  sha256 "152a706365390cc0c4d288c642cf59cd911c997c180b4594108fb28d1dc9991c"
  license "MIT"
  head "https://github.com/IKatsuba/flipbook.git", branch: "main"

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :sequoia
  # Not only to build: every scene is compiled with the same toolchain when it is rendered.
  depends_on xcode: "16.0"

  def install
    system "swift", "build", "--disable-sandbox", "-c", "release", "--product", "flipbook"
    bin.install ".build/release/flipbook"
    # The library's sources travel with the command, which finds them in ../share/flipbook:
    # scenes build against exactly this version, with no network. SwiftPM wants every
    # target's folder to be there, the tests' included.
    pkgshare.install "Package.swift", "Sources", "Tests"
  end

  def caveats
    <<~EOS
      Scenes are built in ~/Library/Caches/flipbook; `flipbook clean` empties it.
      `flipbook doctor` says whether this Mac can render, and `flipbook skill`
      prints the guide to writing a scene.
    EOS
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/flipbook version").strip
    assert_match "try await composition.run()", shell_output("#{bin}/flipbook skill")
    system bin/"flipbook", "new", testpath/"scene.swift"
    assert_path_exists testpath/"scene.swift"
  end
end
