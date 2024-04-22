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

## Install
```bash
sudo curl https://raw.githubusercontent.com/tedbauer/up/main/up.sh > /usr/local/lib/up && \
sudo chmod +x /usr/local/lib/up && \
sudo curl https://github.com/tedbauer/up/raw/main/bin/up-path-gen > /usr/local/lib/up-path-gen && \
chmod +x /usr/local/lib/up-path-gen && \
echo "alias up=\". /usr/local/lib/up\"" > ~/.zshrc && source ~/.zshrc
```
