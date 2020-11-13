class TwineFormatSugarcube2 < Formula
  desc "Story format for Twine/Twee"
  homepage "http://www.motoslave.net/sugarcube/2/"
  url "https://github.com/tmedwards/sugarcube-2/releases/download/v2.33.4/sugarcube-2.33.4-for-twine-2.1-local.zip"
  sha256 "8fcbca7019e72d0e8a1c258d06bd0be6494c6669df4eabe7685cb19cad16219b"
  license "BSD-2-Clause"

  def install
    (share/"tweego"/"storyformats"/"sugarcube-2").install Dir["./*"]
  end
end
