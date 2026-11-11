# From packages/homebrew/tinyeval.rb in https://github.com/evalship-hq/tinyeval, with the tag's url and sha256. Edit it there.
class Tinyeval < Formula
  desc "Evals for AI features, in one bash file"
  homepage "https://tinyeval.com"
  url "https://github.com/evalship-hq/tinyeval/archive/refs/tags/v0.11.0.tar.gz"
  sha256 "64fa1eb2d9c0e627c869dfac1f08f9d8266fba5b22e1b03ddfbbd761b302faa4"
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
