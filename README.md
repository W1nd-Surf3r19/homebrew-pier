# Homebrew-Tap für Pier

[Pier](https://github.com/W1nd-Surf3r19/Pier) ist ein Dock-Ersatz für macOS 15+. Homebrew baut es aus dem Quellcode (Xcode 16 oder neuer nötig).

```sh
brew install w1nd-surf3r19/pier/pier
ln -sf "$(brew --prefix)/opt/pier/Pier.app" ~/Applications/Pier.app
open ~/Applications/Pier.app
```

Aktualisieren mit `brew upgrade pier`. Danach fragt macOS erneut nach Bedienungshilfen und Bildschirmaufnahme, weil die App ad hoc signiert ist.
