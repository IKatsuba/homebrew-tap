cask "roost" do
  version "0.2.2"
  sha256 "f7699a2c7274819551182f14b6d49e390aa5a64f73f1469241150c6bc62fb134"

  url "https://github.com/IKatsuba/roost/releases/download/v#{version}/Roost-#{version}.zip"
  name "Roost"
  desc "Native macOS workspace for Claude Code sessions"
  homepage "https://github.com/IKatsuba/roost"

  livecheck do
    url :url
    strategy :github_latest
  end

  # A bare symbol is the minimum, not an exact match; the ">= :sonoma" spelling
  # that says so out loud is deprecated.
  depends_on macos: :sonoma

  app "Roost.app"

  # The snapshot is the only thing Roost keeps outside the bundle: projects,
  # tabs, the pane tree, and the hook scripts it writes next to them.
  zap trash: [
    "~/Library/Application Support/dev.katsuba.roost",
    "~/Library/Saved Application State/dev.katsuba.roost.savedState",
  ]
end
