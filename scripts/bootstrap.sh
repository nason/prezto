#!/usr/bin/env bash

# Bootstraps a fresh machine.
# Note: make sure you've cloned this repo as described in the README!

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `bootstrap` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# git config --global alias.co checkout
# git remote add upstream https://github.com/sorin-ionescu/prezto.git
# git fetch upstream

# mkdir "${HOME}/Code"

# xcode-select --install

# if [ -z "$(which brew)" ]
# then
#   echo "Installing homebrew..."
#   /usr/bin/env ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
# else
#   echo "Skipping homebrew install..."
# fi

# brew install git zsh grc coreutils
# brew cask install google-chrome dropbox slack

# for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/*; do
#   ln -s "$rcfile" "${ZDOTDIR:-$HOME}"/."$(basename "$rcfile")"
# done

set -e
if [ -z $(cat /etc/shells | grep "$(brew --prefix)"/bin/zsh) ]
  then
    echo "Updating /etc/shells ..."
    sudo echo "$(brew --prefix)"/bin/zsh >> /etc/shells
  else
    echo "Skipping /etc/shells update..."
  fi

sudo chsh -s "$(brew --prefix)"/bin/zsh


# HOWTO: REVERT
# for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/*; do
#  rm -f "${ZDOTDIR:-$HOME}"/."$(basename "$rcfile")"
# done
#
# chsh -s /bin/bash
