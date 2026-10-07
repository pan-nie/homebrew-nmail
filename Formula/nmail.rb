class Nmail < Formula
  desc "AI-driven, local-first aggregated email client"
  homepage "https://github.com/pan-nie/Nmail"
  url "https://github.com/pan-nie/Nmail/releases/download/v0.4.7/nmail-macos-arm64"
  sha256 "d4300ddd297437eb1dffdc11676c2da7d81b8a7ac4ffc1ab15df088e95a917b4"
  license "MIT"
  version "0.4.7"

  depends_on :macos

  def install
    bin.install "nmail-macos-arm64" => "nmail"
  end

  def caveats
    <<~EOS
      Apple Silicon (arm64) build. Linux users: use PyPI instead:
        uvx --from nmail-app nmail
      If Gatekeeper blocks the first launch (unsigned binary):
        xattr -dr com.apple.quarantine #{opt_bin}/nmail
    EOS
  end

  test do
    assert_match "Nmail #{version}", shell_output("#{bin}/nmail --version")
  end
end