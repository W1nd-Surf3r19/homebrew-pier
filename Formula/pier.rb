class Pier < Formula
  desc "Dock-Ersatz für macOS: Pille oder Leiste, Fenster-Vorschau, Gruppen, Launcher"
  homepage "https://github.com/W1nd-Surf3r19/Pier"
  url "https://github.com/W1nd-Surf3r19/Pier/archive/refs/tags/v1.1.tar.gz"
  sha256 "c54b4ea7a6ff3dcadba1b63d60e8e45aa9171f4f0742d9dd556ecad33e6471df"
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
