# homebrew-tap

Homebrew casks for [katsuba.dev](https://katsuba.dev) apps.

```sh
brew tap ikatsuba/tap
brew trust ikatsuba/tap
brew install --cask roost
```

The middle line is not optional: Homebrew 6 refuses to load anything from a tap
outside its own repositories until you say you meant that one.

The `homebrew-` prefix is Homebrew's own convention — it puts it back on the
name, which is why the tap is `ikatsuba/tap` and not `ikatsuba/homebrew-tap`.

## Casks

| | |
|---|---|
| [roost](https://github.com/IKatsuba/roost) | a native macOS workspace for Claude Code sessions |
