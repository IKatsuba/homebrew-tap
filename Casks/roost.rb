cask "roost" do
  version "0.4.1"
  sha256 "1744f00d853652f9c68ada1f665fc3dfcb4550387ca0bd2d87beaed1ac38f796"

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
