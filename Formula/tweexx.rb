class Tweexx < Formula
  desc "Twee compiler/decompiler in C++"
  homepage "https://gitlab.com/ezsh/tweexx"
  url "https://gitlab.com/ezsh/tweexx/-/archive/v0.1.2/tweexx-v0.1.2.tar.bz2"
  sha256 "0d59a8845a2edc86a766ab079f380a3f8051e3bf659eeba0b4bafa6583774a15"
  license "BSD-2-Clause"

  depends_on "cmake" => :build
  depends_on "boost"
  depends_on "gumbo-parser"
  depends_on "spdlog"
  depends_on "twine-story-formats"

  def install
    system "cmake", ".", "-DTWINE_STORYFORMAT_DIRS=/usr/local/share/tweego", *std_cmake_args
    system "make", "install"
  end

  test do
    system "#{bin}/twee2html", "--list-formats"
  end
end
