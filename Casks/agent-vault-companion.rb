cask "agent-vault-companion" do
  version "0.6.0"
  sha256 "6881538534c876cb4b148cc69cf939f28871a084b4498de4e9abc60f41baa6bd"

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

    The app is not notarized yet, so macOS will not open this copy. Replace
    it with a checked copy that opens (after each upgrade, too):

      agent-vault companion install

    Upgrading later, the app and the vault together:

      brew upgrade && agent-vault upgrade && agent-vault companion upgrade
  EOS
end
