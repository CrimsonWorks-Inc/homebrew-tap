class AgentVault < Formula
  desc "Zero-trust local credential proxy for LLM agents"
  homepage "https://github.com/CrimsonWorks-Inc/agent-vault"
  version "0.3.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/CrimsonWorks-Inc/agent-vault/releases/download/v0.3.0/agent-vault-0.3.0-aarch64-apple-darwin.tar.gz"
      sha256 "d23b781501ca4f47d5333a973c680465183d79b6c40a70fc2ff33a6bc170fc38"
    end
    on_intel do
      url "https://github.com/CrimsonWorks-Inc/agent-vault/releases/download/v0.3.0/agent-vault-0.3.0-x86_64-apple-darwin.tar.gz"
      sha256 "23d1449b6b1bd9050134bc186812bfe45847024a7c201c89243375cd5ff3c504"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/CrimsonWorks-Inc/agent-vault/releases/download/v0.3.0/agent-vault-0.3.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1929b6ddc11c50b1aeaee176a3e4d207cba2b05d1db7acfd4e50220098af5eb2"
    end
    on_intel do
      url "https://github.com/CrimsonWorks-Inc/agent-vault/releases/download/v0.3.0/agent-vault-0.3.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8889719fe318726d589b1ca3df887500483b89cc9dec5c5d3b820f83aa959f6d"
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

      Upgrading later (after brew upgrade):

        agent-vault upgrade
    EOS
  end

  test do
    assert_match "agent-vault", shell_output("#{bin}/agent-vault help")
  end
end
