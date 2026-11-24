class AgentVault < Formula
  desc "Zero-trust local credential proxy for LLM agents"
  homepage "https://github.com/CrimsonWorks-Inc/agent-vault"
  version "0.5.3"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/CrimsonWorks-Inc/agent-vault/releases/download/v0.5.3/agent-vault-0.5.3-aarch64-apple-darwin.tar.gz"
      sha256 "5a61b3005ca13963aed765fd1e4091f234022e3c64d1980cbed9f5168f4d7c1e"
    end
    on_intel do
      url "https://github.com/CrimsonWorks-Inc/agent-vault/releases/download/v0.5.3/agent-vault-0.5.3-x86_64-apple-darwin.tar.gz"
      sha256 "178d5e387a20b51cbb40a8101737eb7e66ffd02edb28fd460e74710d552f98e1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/CrimsonWorks-Inc/agent-vault/releases/download/v0.5.3/agent-vault-0.5.3-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c069b83d46dcadd8d733a4690e204c8bc4feaa740c58b704f68b1a05344e44d1"
    end
    on_intel do
      url "https://github.com/CrimsonWorks-Inc/agent-vault/releases/download/v0.5.3/agent-vault-0.5.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4c798afb853eb4b6532a61f5ebf1cd533bce6321a5541a52c15018d44d66ce5b"
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
