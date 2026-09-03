class Ccms < Formula
  desc "Agentic CLI Tool"
  homepage "https://github.com/ReebanAustrive/AI-Assitant-Micro-Saas"
  version "2.1.4"

 on_linux do
    url "https://github.com/ReebanAustrive/AI-Assitant-Micro-Saas/releases/download/v2.1.4/ccms-ubuntu-latest.zip"
    sha256 "6354ddc13f1d328b48e7d7cf49d9eed48a230b134564cd3eb7dee2d1a8f6bcd5"
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