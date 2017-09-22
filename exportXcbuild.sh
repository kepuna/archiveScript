#!/usr/bin/env bash --login
[[ -s "$HOME/.rvm/scripts/rvm"  ]] && source "$HOME/.rvm/scripts/rvm"
rvm use system
xcodebuild "$@"
