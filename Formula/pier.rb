class Pier < Formula
  desc "Dock-Ersatz für macOS: Pille oder Leiste, Fenster-Vorschau, Gruppen, Launcher"
  homepage "https://github.com/W1nd-Surf3r19/Pier"
  url "https://github.com/W1nd-Surf3r19/Pier/archive/refs/tags/v1.0.tar.gz"
  sha256 "6d7c574ef5c902c34a0ef07c0569c9d34b766dfabb54268f44214e38fc58f056"
  license "MIT"

  depends_on xcode: ["16.0", :build]
  depends_on macos: :sequoia

  def install
    ENV["PIER_SIGN_IDENTITY"] = "-"
    system "./build.sh"
    prefix.install "build/Pier.app"
  end

  def caveats
    <<~EOS
      Pier als App verfügbar machen und starten:
        ln -sf #{opt_prefix}/Pier.app ~/Applications/Pier.app
        open ~/Applications/Pier.app

      Pier braucht Bedienungshilfen und Bildschirmaufnahme (Systemeinstellungen ›
      Datenschutz & Sicherheit). Die App ist ad hoc signiert: nach jedem
      `brew upgrade` fragt macOS erneut nach diesen Berechtigungen.

      Vor `brew uninstall pier` Pier über sein Menü beenden, damit das Mac-Dock zurückkommt.
    EOS
  end

  test do
    assert_predicate prefix/"Pier.app/Contents/MacOS/Pier", :executable?
    system "codesign", "--verify", prefix/"Pier.app"
  end
end
