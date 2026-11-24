cask "agent-vault-companion" do
  version "0.5.2"
  sha256 "50e5abefd68b9513826fa4741e8e30c6adfc83c5f0f385029d9139262189e7ad"

  url "https://github.com/CrimsonWorks-Inc/agent-vault/releases/download/v#{version}/agent-vault-companion-#{version}.dmg"
  name "agent-vault companion"
  desc "Island and menu bar companion for agent-vault"
  homepage "https://github.com/CrimsonWorks-Inc/agent-vault"

  depends_on macos: ">= :ventura"
  depends_on formula: "crimsonworks-inc/tap/agent-vault"

  app "agent-vault companion.app"

  zap trash: [
    "~/Library/Application Support/agent-vault companion",
    "~/Library/Preferences/com.iolitelabs.agentvault.companion.plist",
  ]

  caveats <<~EOS
    The companion lives in the notch at the top of the screen (or the menu
    bar, on a screen without one). If agent-vault is not set up yet, run
    `agent-vault setup` once, or let the companion offer it.

    Upgrading later, the app and the vault together:

      brew upgrade && agent-vault upgrade
  EOS
end
