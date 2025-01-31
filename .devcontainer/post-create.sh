#!/bin/bash

# Script to install vscode extensions. 
# Execute this script inside vscode terminal.
# First add execute permission to this file and then execute. 

# chmod +x post-create.sh
# ./uninstall post-create.sh


# Find the full path to the 'code' command
code_path=$(which code)

# Check if the 'code' command was found
if [[ -z "$code_path" ]]; then
  echo "Error: 'code' command not found."
  exit 1
fi

 # Install the desired extensions


# Even Better-toml : To add TOML support.
"$code_path" --install-extension tamasfe.even-better-toml

# Errorlens : To improve highlighting of errors, warnings and other language diagnostics.
"$code_path" --install-extension usernamehw.errorlens

# Vscode-icons : Icons for Visual Studio Code.
"$code_path" --install-extension vscode-icons-team.vscode-icons

# Rust-analyzer : Rust language support for Visual Studio Code.
"$code_path" --install-extension rust-lang.rust-analyzer

# CodeLLDB : A native debugger powered by LLDB. Debug C++, Rust and other compiled languages.
"$code_path" --install-extension vadimcn.vscode-lldb

# Dependi : To manage dependencies and address vulnerabilities in Rust.
"$code_path" --install-extension fill-labs.dependi
 
# Todo Tree : To show TODO, FIXME, etc. comment tags in a tree view.
"$code_path" --install-extension Gruntfuggly.todo-tree
 
# GitLens : Git supercharged : To perform git operations from within VS-Code. 
"$code_path" --install-extension eamodio.gitlens

# Git History : To view git log, file history, compare branches or commits.
"$code_path" --install-extension donjayamanne.githistory

# Resource Monitor : To display current CPU stats, memory/disk consumption, and battery percentage remaining. 
"$code_path" --install-extension mutantdino.resourcemonitor

# Better Comments : To improve code commenting by annotating with alert, informational, TODOs, and more!
"$code_path" --install-extension aaron-bond.better-comments

# Output Colorizer : Syntax highlighting for log files.
"$code_path" --install-extension IBM.output-colorizer

# Cucumber (Gherkin) Full Support : For testing.
"$code_path" --uninstall-extension alexkrechik.cucumberautocomplete

# Trailing Spaces : to highlight trailing spaces and delete them in a flash!
"$code_path" --install-extension shardulm94.trailing-spaces


# Material Icon Theme : Material Design Icons for Visual Studio Code.
"$code_path" --install-extension pkief.material-icon-theme

# Prettier - Code formatter : Code formatter using prettier.
"$code_path" --install-extension esbenp.prettier-vscode


echo "Extensions installed successfully."
