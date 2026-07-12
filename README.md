# tecs-dev Homebrew Tap

Homebrew formulae for [Tecs](https://github.com/tecs-dev/tecs) tooling.

## Install

```sh
brew install tecs-dev/tap/tecs-cli
```

Then create your first project:

```sh
tecs new hello
cd hello
tecs run
```

The first `tecs` command downloads the LÖVE 12 runtime into your user cache;
later commands reuse it. No Lua, LuaRocks, or compiler toolchain is required.

## Updating the formula

Releases of [tecs-cli](https://github.com/tecs-dev/tecs-cli) publish versioned
archives (`tecs-cli-<version>.tar.gz`) with a `SHA256SUMS` file. To bump,
update `url`/`sha256` in `Formula/tecs-cli.rb` accordingly.
