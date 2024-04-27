#!/bin/bash

binary_path="$(brew --prefix)/lib/up-path-gen"

up() {
  path="$binary_path" "$@"
  cd $path
}