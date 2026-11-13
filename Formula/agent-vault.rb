class AgentVault < Formula
  desc "Zero-trust local credential proxy for LLM agents"
  homepage "https://github.com/CrimsonWorks-Inc/agent-vault"
  version "0.3.1"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/CrimsonWorks-Inc/agent-vault/releases/download/v0.3.1/agent-vault-0.3.1-aarch64-apple-darwin.tar.gz"
      sha256 "0adda0438d8c6eeccf92873a265a4375c64850aadae21969ae33515041f53343"
    end
    on_intel do
      url "https://github.com/CrimsonWorks-Inc/agent-vault/releases/download/v0.3.1/agent-vault-0.3.1-x86_64-apple-darwin.tar.gz"
      sha256 "fbda850ddd4b5a39d11984a74c8e0d38af294af0296efff02b08ea9f83d17907"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/CrimsonWorks-Inc/agent-vault/releases/download/v0.3.1/agent-vault-0.3.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "944ad8d93bd1da3b7ee06e3c2a80bd4655fb14239be1a04063841768828d2162"
    end
    on_intel do
      url "https://github.com/CrimsonWorks-Inc/agent-vault/releases/download/v0.3.1/agent-vault-0.3.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e9169153d8d1849ee95724e71349e0b9fd78cec5fdbcb2b5cea7d2b2e06e346d"
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
