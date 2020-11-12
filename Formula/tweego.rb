class Tweego < Formula
  desc "Command-line compiler for Twine/Twee story formats, written in Go"
  homepage "http://www.motoslave.net/tweego/"
  url "https://github.com/tmedwards/tweego/archive/v2.1.1.tar.gz"
  sha256 "f58991ff0b5b344ebebb5677b7c21209823fa6d179397af4a831e5ef05f28b02"
  license "BSD-2-Clause"

  depends_on "go" => :build
  depends_on "twine-story-formats"

  def install
    ENV.deparallelize
    system "go", "build", *std_go_args
    # move the binary to libexec and install in bin a script that sets TWEEGO_PATH
    libexec.install (bin/"tweego")
    (buildpath/"tweego").write <<~EOS
      #!/bin/sh
      TWEEGO_PATH="/usr/local/share/tweego/storyformats:${TWEEGO_PATH}" #{libexec}/tweego "$@"
    EOS
    bin.install "tweego"
  end

  test do
    (testpath/"test.twee").write <<~EOS
      :: StoryTitle
      Test story

      :: Start
      Start passage

      :: StoryData
      {
        "ifid": "0D9299F2-5289-4E2D-9568-23527B44A57D"
      }
    EOS
    system "#{bin}/tweego", "test.twee"
  end
end
