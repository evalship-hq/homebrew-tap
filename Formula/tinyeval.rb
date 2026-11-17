# From packages/homebrew/tinyeval.rb in https://github.com/evalship-hq/tinyeval, with the tag's url and sha256. Edit it there.
class Tinyeval < Formula
  desc "Evals for AI features, in one bash file"
  homepage "https://tinyeval.com"
  url "https://github.com/evalship-hq/tinyeval/archive/refs/tags/v0.12.0.tar.gz"
  sha256 "269007a6c9553a99bf2df28064e4feb3ea7e251a9be7a5174ef3584a7c2495af"
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
