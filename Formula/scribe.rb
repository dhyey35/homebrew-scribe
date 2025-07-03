# Formula/scribe.rb
class Scribe < Formula
  desc "A tool to bundle all git-tracked files for LLM context"
  homepage "https://github.com/dhyey35/scribe" # <-- CHANGE THIS
  url "https://github.com/dhyey35/scribe/archive/refs/tags/v1.0.0.tar.gz" # <-- PASTE URL HERE
  sha256 "e94a8d4ee4e404f38efd8098525c1adb234cef27359e2506f35334e3c4b54b61" # <-- PASTE SHA256 HERE
  license "MIT"
  version "1.0.0"

  def install
    # This tells Homebrew to install the 'scribe' script into the bin directory,
    # making it executable and available in the user's PATH.
    bin.install "scribe"
  end

  # This section defines a test that Homebrew can run to verify the installation.
  test do
    # Create a dummy git repository for testing
    system "git", "init"
    system "touch", "test_file.txt"
    system "git", "add", "test_file.txt"
    
    # Check if the tool runs without errors and produces expected output
    # The `shell_output` helper captures the command's stdout.
    output = shell_output("#{bin}/scribe")
    assert_match "--- FILE: ./test_file.txt ---", output
    
    # Test the version command
    assert_match "scribe version #{version}", shell_output("#{bin}/scribe --version")
  end
end 