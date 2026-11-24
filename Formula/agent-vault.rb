class AgentVault < Formula
  desc "Zero-trust local credential proxy for LLM agents"
  homepage "https://github.com/CrimsonWorks-Inc/agent-vault"
  version "0.5.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/CrimsonWorks-Inc/agent-vault/releases/download/v0.5.0/agent-vault-0.5.0-aarch64-apple-darwin.tar.gz"
      sha256 "e42c856498cea61c853223033ef71994fd49c5af3bc95644b6857838fe3e5d94"
    end
    on_intel do
      url "https://github.com/CrimsonWorks-Inc/agent-vault/releases/download/v0.5.0/agent-vault-0.5.0-x86_64-apple-darwin.tar.gz"
      sha256 "faf5a3e0cc33607e2c8e51f5d2089c3ab2b42ec4b38b51bdc03cc8f9af6f70d7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/CrimsonWorks-Inc/agent-vault/releases/download/v0.5.0/agent-vault-0.5.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e549f2291554b9ea064922614fe6bc3b818a6de0201487f57e74a0dae3d3e064"
    end
    on_intel do
      url "https://github.com/CrimsonWorks-Inc/agent-vault/releases/download/v0.5.0/agent-vault-0.5.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "fb379e99eeef2428f810f3fb9bf2038b4dafc94be79594a2817c28447ae999c1"
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
