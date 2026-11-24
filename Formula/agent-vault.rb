class AgentVault < Formula
  desc "Zero-trust local credential proxy for LLM agents"
  homepage "https://github.com/CrimsonWorks-Inc/agent-vault"
  version "0.4.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/CrimsonWorks-Inc/agent-vault/releases/download/v0.4.0/agent-vault-0.4.0-aarch64-apple-darwin.tar.gz"
      sha256 "8902370408d92a51ba88cb8e0127622e45ba64c9f56bc81f8f342da17798c4c2"
    end
    on_intel do
      url "https://github.com/CrimsonWorks-Inc/agent-vault/releases/download/v0.4.0/agent-vault-0.4.0-x86_64-apple-darwin.tar.gz"
      sha256 "423cae9f2f7af6c85b7674e58e6ddee3105077c7d091ae7992c54d35a3fa7143"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/CrimsonWorks-Inc/agent-vault/releases/download/v0.4.0/agent-vault-0.4.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3f9ad2c7f67a5807fffe65d020814b9511139894c1c27de69c86071ea02ad5d4"
    end
    on_intel do
      url "https://github.com/CrimsonWorks-Inc/agent-vault/releases/download/v0.4.0/agent-vault-0.4.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2b10344f08216272823a68611f0faadc51907b1dad2247d2b3733c2a9c24e345"
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
