@echo off

REM ---------------------------------------------------------------------------------------------------------------
REM Author : Ganesh K Jadhav
REM Date : January 07, 2025.
REM Version : 1.0.0
REM Description : Small batch script to create the 'rust_programs' directory and 'history' directory for .zsh_history file.
REM ---------------------------------------------------------------------------------------------------------------

REM Take back-up of previous history and rust_programs directory before building new image.

REM Create the required directories and file.
REM 'history' directory is mounted to rust devcontainer and used to store .zsh_history file.
REM 'rust_programs' directory is also mounted to rust devcontainer and used to store rust programs persistently on host.

mkdir ..\history
mkdir ..\rust_programs

REM Create .zsh_history file in the 'history' directory. This file is used to store zsh command history persistently.
echo. > ..\history\.zsh_history

echo History file and 'rust_programs' directory created successfully!