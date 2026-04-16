class Waves < Formula
  desc "Product Consciousness Framework for AI agents — Claude Code, Codex, Gemini CLI"
  homepage "https://github.com/exovian-developments/waves"
  url "https://github.com/exovian-developments/waves/archive/refs/tags/v2.1.0.tar.gz"
  sha256 "f1bd057094850c8c167d4063cc840b4665d6b9277080c895f0b43975aba54668"
  license "AGPL-3.0-or-later"

  def install
    bin.install "bin/waves"

    data_dir = share/"waves"
    data_dir.install "schemas"

    (data_dir/".claude"/"commands").mkpath
    Dir[".claude/commands/*.md"].each do |cmd|
      (data_dir/".claude"/"commands").install cmd
    end

    (data_dir/".claude"/"hooks").mkpath
    Dir[".claude/hooks/*.sh"].each do |hook|
      (data_dir/".claude"/"hooks").install hook
    end

    (data_dir/".claude").install ".claude/settings.json"
  end

  def caveats
    <<~EOS
      waves has been installed!

      To set up a new project:
        cd your-project
        waves init claude

      To update an existing project:
        cd your-project
        waves update

      After initialization, start Claude Code and run:
        /waves:project-init

      Documentation: https://github.com/exovian-developments/waves
    EOS
  end

  test do
    assert_match "waves version #{version}", shell_output("#{bin}/waves --version")
  end
end