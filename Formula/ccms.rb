class Ccms < Formula
  desc "Agentic CLI Tool"
  homepage "https://github.com/ReebanAustrive/AI-Assitant-Micro-Saas"
  version "2.1.3"

  on_linux do
    url "https://github.com/ReebanAustrive/AI-Assitant-Micro-Saas/releases/download/v2.1.3/ccms-ubuntu-latest.zip"
    sha256 "7058344cbd044abcfd90889462b99a4bff6ae541e50c3ac141c54da98554030c"
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