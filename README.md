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

```bash
$ pwd
/simple/path/example/hello/longerstring/example/another
$ up lon
$ pwd
/simple/path/example/hello/longerstring
```