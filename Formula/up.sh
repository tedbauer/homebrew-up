#!/bin/bash

binary_path="$(brew --prefix)/lib/up-path-gen"

up() {
  if [ $# -eq 0 ]; then
    echo "Usage: up <argument>"
    return 1
  fi

  target_path="$1"
  full_command="$binary_path $target_path"

  "$full_command"
}