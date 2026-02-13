class Brr < Formula
  desc "A delightful TUI speedtest with bufferbloat grading"
  homepage "https://github.com/allenan/brr"
  url "https://github.com/allenan/brr/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "d115262f72c1dd291d409ca483e8531a2a73111202bfa9b9d983b8678408ca6a"
  license "MIT"

  depends_on "go" => :build

  def install
    ldflags = "-s -w -X main.version=#{version}"
    system "go", "build", *std_go_args(ldflags: ldflags), "./cmd/brr"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/brr --version")
  end
end
