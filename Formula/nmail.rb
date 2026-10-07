class Nmail < Formula
  desc "AI-driven, local-first aggregated email client"
  homepage "https://github.com/pan-nie/Nmail"
  url "https://github.com/pan-nie/Nmail/releases/download/v0.4.6/nmail-macos-arm64"
  sha256 "e240096ae27efff293615139ed6415359590ea3b84c618bc910eeeefa9971339"
  license "MIT"
  version "0.4.6"

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