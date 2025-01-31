#!/bin/bash

# Script to uninstall vscode extensions.
# Execute this file inside vscode terminal.
# First add execute permission to this file and then execute.

# chmod +x uninstall-vscode-extensions.sh
# ./uninstall-vscode-extensions.sh


# Find the full path to the 'code' command
code_path=$(which code)

# Check if the 'code' command was found
if [[ -z "$code_path" ]]; then
  echo "Error: 'code' command not found."
  exit 1
fi

# Uninstall the desired extensions

"$code_path" --uninstall-extension tamasfe.even-better-toml
"$code_path" --uninstall-extension usernamehw.errorlens
"$code_path" --uninstall-extension vscode-icons-team.vscode-icons
"$code_path" --uninstall-extension rust-lang.rust-analyzer
"$code_path" --uninstall-extension vadimcn.vscode-lldb
"$code_path" --uninstall-extension fill-labs.dependi
"$code_path" --uninstall-extension Gruntfuggly.todo-tree
"$code_path" --uninstall-extension eamodio.gitlens
"$code_path" --uninstall-extension donjayamanne.githistory
"$code_path" --uninstall-extension mutantdino.resourcemonitor
"$code_path" --uninstall-extension aaron-bond.better-comments
"$code_path" --uninstall-extension IBM.output-colorizer
"$code_path" --uninstall-extension alexkrechik.cucumberautocomplete
"$code_path" --uninstall-extension shardulm94.trailing-spaces
"$code_path" --uninstall-extension pkief.material-icon-theme
"$code_path" --uninstall-extension esbenp.prettier-vscode


echo "Extensions uninstalled successfully."
