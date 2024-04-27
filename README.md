# 🦘 up

`up` is a humble utility to help you easily jump up multiple directories.

```bash
$ pwd
/simple/path/example/hello/world
$ up example
$ pwd
/simple/path/example
```

```bash
$ pwd
/simple/path/example/hello/world/example/another
$ up example
$ pwd
/simple/path/example/hello/world/example
```

```bash
$ pwd
/simple/path/example/hello/longerstring/example/another
$ up lon
$ pwd
/simple/path/example/hello/longerstring
```

## Installation

With [Homebrew](https://brew.sh/):

```shell
brew tap tedbauer/homebrew-up
brew install tedbauer/homebrew-up/up
```
