# betterCallHex Homebrew tap

```sh
brew trust --tap betterCallHex/tap
brew install --cask betterCallHex/tap/awake
brew install --cask betterCallHex/tap/flick
brew install betterCallHex/tap/pressure-guard && brew services start pressure-guard
```

Homebrew 7+ only loads third-party taps you trust; skip the first line on older Homebrew.

| Cask | Description |
| --- | --- |
| [awake](https://github.com/betterCallHex/awake) | Menu bar app that keeps your Mac awake |
| [flick](https://github.com/betterCallHex/flick) | Fast, quiet video player built on libmpv |

| Formula | Description |
| --- | --- |
| [pressure-guard](https://github.com/betterCallHex/pressure-guard) | Slows macOS background services under memory pressure or heat, never your apps |
