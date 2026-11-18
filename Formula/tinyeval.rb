# From packages/homebrew/tinyeval.rb in https://github.com/evalship-hq/tinyeval, with the tag's url and sha256. Edit it there.
class Tinyeval < Formula
  desc "Evals for AI features, in one bash file"
  homepage "https://tinyeval.com"
  url "https://github.com/evalship-hq/tinyeval/archive/refs/tags/v0.12.1.tar.gz"
  sha256 "f8ebb8d4f6104bf33f168cc12b5d6bbd48c66749e5dc8f652b66422212a4080f"
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
