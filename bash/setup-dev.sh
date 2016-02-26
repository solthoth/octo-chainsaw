#!/bin/sh

function InstallHomebrew() {
  which -s brew
  if [[ $? != 0 ]] ; then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  else
    brew update
  fi
  brew install wget
}

function InstallSysTools() {
  brew install git
}

function InstallWebTools() {
  # install NodeJS
  brew install node
  # install packages via NPM
  npm install -g n
  npm install -g node-gyp
  npm install -g gulp
  npm install -g bower
  npm install -g grunt-cli
  npm install -g jshint
  npm install -g coffee-script
  npm install -g express-generator
  npm install -g less
  # install packages via GEM
  gem install sass
}

function InstallNoSQLDBs() {
  brew install mongodb
  brew install redis
}

# main
echo "Installing/Updating Homebrew"
InstallHomebrew
which -s brew
if [[ $? == 0 ]] ; then
  echo "Installing System Tools"
  InstallSysTools
  echo "Installing Web Development Tools"
  InstallWebTools
  echo "Installing NoSQL DBs"
  InstallNoSQLDBs
else
  echo "Failed to locate Homebrew"
fi
