class Ccms < Formula
  desc "Igot AI Code Review CLI"
  homepage "https://github.com/ReebanAustrive/AI-Assitant-Micro-Saas"
  version "2.2.6"

  on_macos do
    # CI builds on macos-latest, which is Apple Silicon only.
    depends_on arch: :arm64
    url "https://github.com/ReebanAustrive/AI-Assitant-Micro-Saas/releases/download/v2.2.6/ccms-macos-latest.zip"
    sha256 "REPLACE_WITH_MACOS_SHA256"
  end

  on_linux do
    url "https://github.com/ReebanAustrive/AI-Assitant-Micro-Saas/releases/download/v2.2.6/ccms-ubuntu-latest.zip"
    sha256 "ae4c4d541836bcb14253b0825e2d028204df5bcf8cc886b8d5cd4f87315c5163"
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
