require 'formula'

class Yajl1 < Formula
  homepage 'http://lloyd.github.com/yajl/'
  url 'http://github.com/lloyd/yajl/tarball/1.0.12'
  sha256 'df27bb20903f68e40c62cdc616a37816d9b8f2bbe943900c5dad16a20dc5d326'

  # Configure uses cmake, even though it looks like we're
  # just using autotools below.
  depends_on 'cmake' => :build

  def install
    ENV.deparallelize

    system "./configure", "--prefix=#{prefix}"
    system "make install"
    (include + 'yajl').install Dir['src/api/*.h']
  end
end
