class AgentVault < Formula
  desc "Zero-trust local credential proxy for LLM agents"
  homepage "https://github.com/CrimsonWorks-Inc/agent-vault"
  version "0.5.2"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/CrimsonWorks-Inc/agent-vault/releases/download/v0.5.2/agent-vault-0.5.2-aarch64-apple-darwin.tar.gz"
      sha256 "91b05173a8babe9d326d46536608fd849435b9aa2f251dc513046990cf278ca5"
    end
    on_intel do
      url "https://github.com/CrimsonWorks-Inc/agent-vault/releases/download/v0.5.2/agent-vault-0.5.2-x86_64-apple-darwin.tar.gz"
      sha256 "3171e266ecbc7c5d4abcf7130da6e3ce418c3962d6ae7da516e65d68824e41dc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/CrimsonWorks-Inc/agent-vault/releases/download/v0.5.2/agent-vault-0.5.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "323b6a37a114abeab05235a994b9e2eb4417a3cd3548122ff178374e0261d1f1"
    end
    on_intel do
      url "https://github.com/CrimsonWorks-Inc/agent-vault/releases/download/v0.5.2/agent-vault-0.5.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "93c44dd444fe71c6e344a87c631c4d9b309e1084d86b2113b6e5f201f72e50de"
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
