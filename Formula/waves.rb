class Waves < Formula
  desc "Product Consciousness Framework for AI agents — Claude Code, Codex, Gemini CLI"
  homepage "https://github.com/exovian-developments/waves"
  url "https://github.com/exovian-developments/waves/archive/refs/tags/v2.1.2.tar.gz"
  sha256 "5d4edda8664c4a6a8e4b65ab1454f1c8fb61c05ad0eae41ebe6d66cbda784508"
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