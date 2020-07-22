#!/bin/bash
set -exo pipefail

brew leaves | tee installed_packages/homebrew.txt
# brew cask list | sed -e 's/\s+/\n/g' | tee installed_packages/homebrew_cask.txt
cat ~/.tool-versions | tee installed_packages/asdf.txt
pip freeze | tee installed_packages/pip.txt
npm -g list --depth=0 | grep -oP '(?<=\s).*' | tee installed_packages/npm.txt
code --list-extensions | tee installed_packages/vscode.txt
