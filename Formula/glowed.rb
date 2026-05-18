class Glowed < Formula
  desc "Ghostty-oriented terminal TUI Markdown browser/editor"
  homepage "https://github.com/khw1031/glowed"
  url "https://github.com/khw1031/glowed/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "19d1239ac12d9dbc3c6e66e6843e634dfb1d0882f608647a705779dc957b8039"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", "-trimpath", "-ldflags=-s -w -X main.version=#{version}", "-o", bin/"glowed", "./cmd/glowed"
  end

  test do
    assert_match "glowed #{version}", shell_output("#{bin}/glowed --version")
  end
end
