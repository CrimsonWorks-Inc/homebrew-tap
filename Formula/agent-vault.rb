class AgentVault < Formula
  desc "Zero-trust local credential proxy for LLM agents"
  homepage "https://github.com/CrimsonWorks-Inc/agent-vault"
  version "0.6.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/CrimsonWorks-Inc/agent-vault/releases/download/v0.6.0/agent-vault-0.6.0-aarch64-apple-darwin.tar.gz"
      sha256 "f16ff8c1176e24d07f61b76cc092889d94139526ce370b5de2ad55599a68f2ff"
    end
    on_intel do
      url "https://github.com/CrimsonWorks-Inc/agent-vault/releases/download/v0.6.0/agent-vault-0.6.0-x86_64-apple-darwin.tar.gz"
      sha256 "fabb65c673c3cd5d147ff84ebf2e007d478c8a3f51f9cec673b90409a9229d51"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/CrimsonWorks-Inc/agent-vault/releases/download/v0.6.0/agent-vault-0.6.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "14661fe6f1e75063a2588b17fba19b9dad8f1697da9d15c2678583e6e1115614"
    end
    on_intel do
      url "https://github.com/CrimsonWorks-Inc/agent-vault/releases/download/v0.6.0/agent-vault-0.6.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c37d5940e19f09976c32beed9c9f6b3daa72189ad10004c15c3885dfdde85cad"
    end
  end

  def install
    bin.install "bin/agent-vault", "bin/agent-vault-daemon", "bin/agent-vault-setup"
    bin.install_symlink "agent-vault" => "av"
  end

  def caveats
    <<~EOS
      agent-vault keeps its vault under a separate system user, so an agent
      running as you cannot read it. One privileged step sets that up; it
      shows the plan and asks before running sudo:

        agent-vault setup

      Upgrading later:

        brew upgrade agent-vault && agent-vault upgrade

      upgrade installs this release into the root-owned service; it asks
      for your password (or Touch ID) each time.
    EOS
  end

  test do
    assert_match "agent-vault", shell_output("#{bin}/agent-vault help")
  end
end
