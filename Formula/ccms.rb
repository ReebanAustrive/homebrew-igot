class Ccms < Formula
  desc "Igot AI Code Review CLI"
  homepage "https://github.com/ReebanAustrive/AI-Assitant-Micro-Saas"
  version "2.1.6"

  on_macos do
    # CI builds on macos-latest, which is Apple Silicon only.
    depends_on arch: :arm64
    url "https://github.com/ReebanAustrive/AI-Assitant-Micro-Saas/releases/download/v2.1.6/ccms-macos-latest.zip"
    sha256 "REPLACE_WITH_MACOS_SHA256"
  end

  on_linux do
    url "https://github.com/ReebanAustrive/AI-Assitant-Micro-Saas/releases/download/v2.1.6/ccms-ubuntu-latest.zip"
    sha256 "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
  end

  def install
    # The zip holds one raw binary; install it as the global 'ccms' command.
    if OS.mac?
      bin.install "ccms-macos-latest" => "ccms"
    else
      bin.install "ccms-ubuntu-latest" => "ccms"
    end
  end

  test do
    assert_match "AVAILABLE COMMANDS", shell_output("#{bin}/ccms help")
  end
end
