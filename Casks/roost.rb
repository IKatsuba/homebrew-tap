cask "roost" do
  version "0.3.0"
  sha256 "3072fc0a99f82fe74629fc4bc9837b1c022247579fb767cde12277fa5c88178b"

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
