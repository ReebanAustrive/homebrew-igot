class Ccms < Formula
  desc "Agentic CLI Tool"
  homepage "https://github.com/ReebanAustrive/AI-Assitant-Micro-Saas"
  version "2.1.5"

 on_linux do
    url "https://github.com/ReebanAustrive/AI-Assitant-Micro-Saas/releases/download/v2.1.5/ccms-ubuntu-latest.zip"
    sha256 "bf3d6f4bb6b43830cdaa1bb9469e8c23cfd23fceec40ea15f5d3bf6a3cd7ebe0"
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