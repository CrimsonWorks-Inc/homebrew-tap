class AgentVault < Formula
  desc "Zero-trust local credential proxy for LLM agents"
  homepage "https://github.com/CrimsonWorks-Inc/agent-vault"
  version "0.3.2"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/CrimsonWorks-Inc/agent-vault/releases/download/v0.3.2/agent-vault-0.3.2-aarch64-apple-darwin.tar.gz"
      sha256 "8f97529211dd62b9abcedee9a21b8d62312a08b27547f8018b90a5d36fb27722"
    end
    on_intel do
      url "https://github.com/CrimsonWorks-Inc/agent-vault/releases/download/v0.3.2/agent-vault-0.3.2-x86_64-apple-darwin.tar.gz"
      sha256 "51ef9e95e679a090adb84279ec8c732ad0911ec14fc2eed3f0ad7898daf3930a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/CrimsonWorks-Inc/agent-vault/releases/download/v0.3.2/agent-vault-0.3.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "74a563606a257b6adf1c09995fae0e23797e66860570513857c47d3742f632ed"
    end
    on_intel do
      url "https://github.com/CrimsonWorks-Inc/agent-vault/releases/download/v0.3.2/agent-vault-0.3.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6cff3bcc1005cd58727a9c3347a260da564842c723240986fb6881522c19dff1"
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
