#!/bin/sh

function InstallHomebrew() {
  which -s brew
  if [[ $? != 0 ]] ; then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  else
    brew update
  fi
  brew bundle install
}

# main
echo "Installing/Updating Homebrew"
InstallHomebrew
which -s brew
