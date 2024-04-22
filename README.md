# 🦘 up

Jump up multiple directory levels.

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

## Install
```bash
./install.sh && echo "alias up=\". /usr/local/lib/up\"" > ~/.zshrc
```