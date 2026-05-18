class Glowed < Formula
  desc "Ghostty-oriented terminal TUI Markdown browser/editor"
  homepage "https://github.com/khw1031/glowed"
  url "https://github.com/khw1031/glowed/archive/refs/tags/v0.2.1.tar.gz"
  sha256 "f2efe96fbf3082270f77723bf0e27729bc98599f5eafb8b2ca8f80d61721ced2"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", "-trimpath", "-ldflags=-s -w -X main.version=#{version}", "-o", bin/"glowed", "./cmd/glowed"
  end

  test do
    assert_match "glowed #{version}", shell_output("#{bin}/glowed --version")
  end
end
