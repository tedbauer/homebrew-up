#!/bin/bash

binary_path="$(brew --prefix)/lib/up-path-gen"

up_completion() {
    completions=$($binary_path --complete $COMP_CWORD)
    echo -e "$completions"
}

up() {
  if [ $# -eq 0 ]; then
    echo "Usage: up <path|path-prefix>"
    return 1
  fi

  target="$1"
  full_command="$binary_path $target"
  
  target_path=$($full_command)
  cd "$target_path"
}

complete -F up_completion up