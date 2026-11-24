class AgentVault < Formula
  desc "Zero-trust local credential proxy for LLM agents"
  homepage "https://github.com/CrimsonWorks-Inc/agent-vault"
  version "0.5.1"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/CrimsonWorks-Inc/agent-vault/releases/download/v0.5.1/agent-vault-0.5.1-aarch64-apple-darwin.tar.gz"
      sha256 "ad3f0a84e807c262030f5981be57b75f85c2252d68073f8258caabbda8614b01"
    end
    on_intel do
      url "https://github.com/CrimsonWorks-Inc/agent-vault/releases/download/v0.5.1/agent-vault-0.5.1-x86_64-apple-darwin.tar.gz"
      sha256 "a703f60b95e8c7e2c603faee4a2cbc40c60c7fcbc772318733ba96e768b282a6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/CrimsonWorks-Inc/agent-vault/releases/download/v0.5.1/agent-vault-0.5.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "814f54e120bf39f5354b65bd6ed27b1eb44a45d54427c2e34b03e6b01044eb44"
    end
    on_intel do
      url "https://github.com/CrimsonWorks-Inc/agent-vault/releases/download/v0.5.1/agent-vault-0.5.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e334bbf9cd5ccd03b17681ca7f11af6e7f380aa74b85b3063ef815b14bf65b85"
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
