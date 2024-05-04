#!/bin/bash

# binary_path="$(brew --prefix)/lib/up-path-gen"

up_completion() {
    completions=$($BINARY_PATH --complete $COMP_CWORD $COMP_LINE)
    COMPREPLY=($completions)
}

up() {
  if [ $# -eq 0 ]; then
    echo "Usage: up <path|path-prefix>"
    return 1
  fi

  target="$1"
  full_command="$BINARY_PATH $target"
  
  target_path=$(eval "$full_command")
  cd "$target_path"
}

if [ "$0" = "-bash" ]; then
  complete -F up_completion up
fi
