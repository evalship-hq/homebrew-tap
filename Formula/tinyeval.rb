# From packages/homebrew/tinyeval.rb in https://github.com/evalship-hq/tinyeval, with the tag's url and sha256.
# Edit it there.
class Tinyeval < Formula
  desc "Evals for AI features, in one bash file"
  homepage "https://tinyeval.com"
  url "https://github.com/evalship-hq/tinyeval/archive/refs/tags/v0.12.2.tar.gz"
  sha256 "92a95fe64d3fe1599230b93804e9bb3f2b85cc4610959f5cf5b22fcdac8cffde"
  license "MIT"

  def install
    libexec.install "tinyeval"
    # bash 3.2 is enough, so macOS's /bin/bash or Linux's runs it.
    (bin/"tinyeval").write_env_script "bash", libexec/"tinyeval", TINYEVAL_PACKAGE_UPDATE: "brew upgrade tinyeval"
  end

  test do
    assert_equal "tinyeval #{version}", shell_output("#{bin}/tinyeval -v").strip
  end
end
