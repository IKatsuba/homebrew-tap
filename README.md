# homebrew-tap

Homebrew casks and formulae for [katsuba.dev](https://katsuba.dev) apps and tools.

```sh
brew tap ikatsuba/tap
brew trust ikatsuba/tap
brew install --cask roost
brew install flipbook
```

The middle line is not optional: Homebrew 6 refuses to load anything from a tap
outside its own repositories until you say you meant that one.

The `homebrew-` prefix is Homebrew's own convention — it puts it back on the
name, which is why the tap is `ikatsuba/tap` and not `ikatsuba/homebrew-tap`.

## Casks

| | |
|---|---|
| [roost](https://github.com/IKatsuba/roost) | a native macOS workspace for Claude Code sessions |

## Formulae

| | |
|---|---|
| [flipbook](https://github.com/IKatsuba/flipbook) | videos from SwiftUI views; a command that renders a scene written as one Swift file |
