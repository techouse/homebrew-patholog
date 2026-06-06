class Patholog < Formula
  desc "Diagnose, explain, clean, and safely repair PATH behavior"
  homepage "https://techouse.github.io/patholog/"
  url "https://github.com/techouse/patholog/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "e9ae16bf12c711f256aa69783db4e9e61bc60d9303e48de5980bb74e34a09cb3"
  license "BSD-3-Clause"
  head "https://github.com/techouse/patholog.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: ".")

    generate_completions_from_executable(bin/"patholog", "completions")
  end

  test do
    assert_match "patholog #{version}", shell_output("#{bin}/patholog --version")
    assert_match '"score"', shell_output("#{bin}/patholog health --json")
  end
end
