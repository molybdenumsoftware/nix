#!/usr/bin/env bash

source common.sh

# syntax error is not caught

file=$(mktemp --suffix ".nix")
echo '}' > $file

expectStderr 1 nix eval -v --json --expr "
  builtins.catchEvalError (import $file)
" | grep "error: invalid syntax somthing"
