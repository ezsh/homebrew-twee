class TwineStoryFormats < Formula
  desc "Story formats extracted from Twine to use with Tweego/Tweexx"
  homepage "https://github.com/klembot/twinejs"
  url "https://github.com/klembot/twinejs/archive/2.3.9.tar.gz"
  sha256 "5de5893d65caa20c6e5ceda8ce63234077c51a320074151aab1e8942435363a0"
  license "GPL-3.0"
  head "https://github.com/klembot/twinejs.git", branch: "main"

  depends_on "twine-format-sugarcube-2"

  def install
    ENV.deparallelize
    Dir.chdir("story-formats")
    Dir.each_child(".") do |d|
      next if d.start_with?("sugarcube-2")

      id = d.match(/[a-z]+-[0-9]/)[0]
      ohai id
      File.rename(d, id)
      (share/"tweego"/"storyformats").install id
    end
  end
end
