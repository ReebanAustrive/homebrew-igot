class Ccms < Formula
  desc "Agentic CLI Tool"
  homepage "https://github.com/ReebanAustrive/AI-Assitant-Micro-Saas"
  version "2.1.2"

  on_linux do
    url "https://github.com/ReebanAustrive/AI-Assitant-Micro-Saas/releases/download/v2.1.2/ccms-ubuntu-latest.zip"
    sha256 "c04374b7a9b1e96bc1a2e5fb076ab426702c3fa855d03e8cb7a052f81bd78da3  ccms-ubuntu-latest.zip"
  end

  def install
    # This automatically unpacks the zip and maps the raw binary to the global 'ccms' command
    if OS.mac?
      bin.install "ccms-macos-latest" => "ccms"
    elsif OS.linux?
      bin.install "ccms-ubuntu-latest" => "ccms"
    end
  end
end