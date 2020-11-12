class TwineFormatSugarcube2 < Formula
  desc "Story format for Twine/Twee"
  homepage "http://www.motoslave.net/sugarcube/2/"
  url "https://github.com/tmedwards/sugarcube-2/releases/download/v2.33.3/sugarcube-2.33.3-for-twine-2.1-local.zip"
  sha256 "cd4d699f28ce7deb586598b86101c9fe93ee32758f4f2de29480f7eea72f6663"
  license "BSD-2-Clause"

  def install
    (share/"tweego"/"storyformats"/"sugarcube-2").install Dir["./*"]
  end
end
