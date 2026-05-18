class Glowed < Formula
  desc "Ghostty-oriented terminal TUI Markdown browser/editor"
  homepage "https://github.com/khw1031/glowed"
  url "https://github.com/khw1031/glowed/archive/refs/tags/v0.2.2.tar.gz"
  sha256 "b79cbdb4af757ee10a9ddf263fa172c8031068aa3efd9a072c53116617a78ef2"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", "-trimpath", "-ldflags=-s -w -X main.version=#{version}", "-o", bin/"glowed", "./cmd/glowed"
  end

  test do
    assert_match "glowed #{version}", shell_output("#{bin}/glowed --version")
  end
end
