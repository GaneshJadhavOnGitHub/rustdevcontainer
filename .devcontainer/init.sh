#!/bin/bash

#---------------------------------------------------------------------------------------------------------------#
# Author : Ganesh K Jadhav
# Date : January 07, 2025.
# Version : 1.0.0
# Description : Small shell script to create the 'rust_programs' directiry and 'history' directory for .zsh_history file.
#---------------------------------------------------------------------------------------------------------------#

# Take back-up of previous history and rust_programs directory before building new image.

# Create the required directories and file.
# 'history' directory is mounted to rust devcontainer and used to store .zsh_history file.
# 'rust_programs' directory is also mounted to rust devcontainer and used to store rust programs persistently on host.

mkdir -p ../history
mkdir -p ../rust_programs

# Create .zsh_history file in the 'history' directory. This file is used to store zsh command history persistently.
touch ../history/.zsh_history
echo "History file and 'rust_programs' directory created successfully!"

