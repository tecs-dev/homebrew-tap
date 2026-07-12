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

## Updates

The Bump formula workflow polls
[tecs-cli releases](https://github.com/tecs-dev/tecs-cli/releases) and
rewrites the formula to each new release's `tecs-cli-<version>.tar.gz`,
verifying the hash against the published `SHA256SUMS`.
