#--------------------------------------------------------------------------------------------------------------------#
# Author : Ganesh K Jadhav
# Date : January 23, 2025 to January 29, 2025.
# Version : 1.0.0
# Description : Dockerfile to create and run rust devcontainer for rust programming'.
#--------------------------------------------------------------------------------------------------------------------#

# Tested on Jan29, 2025  --  Working 
# Image size is 3.35 GB


# Ubuntu 22.04 is used as base image for rust development container.
FROM ubuntu:22.04

# Define build arguments for this Dockerfile.

# This ARGUMENT is used to set value of MAINTAINER of this Dockerfile.
ARG MAINTAINER

# This ARGUMENT is used to set value of VERSION of this Dockerfile.
ARG VERSION

# This ARGUMENT is used to set value of DESCRIPTION for this Dockerfile.
ARG DESCRIPTION

# This ARGUMENT is used to set value of  Environment Variable DEBIAN_FRONTEND.
ARG DEBIAN_FRONTEND

# This ARGUMENT is used to set value of  Environment Variable EDITOR.
ARG EDITOR

# This ARGUMENT is used to set value of  Environment Variable TERM.
ARG TERM

# This ARGUMENT is used to set value of  Environment Variable LANG.
ARG LANG

# This ARGUMENT is used to set value of  Environment Variable LANGUAGE.
ARG LANGUAGE

# This ARGUMENT is used to set value of  Environment Variable LC_ALL.
ARG LC_ALL

# This ARGUMENT is used to set value of  Environment Variable TZ.
ARG TZ

#ARG RUST_PATH

# Set values of LABELS showing information about Dockerfile.
LABEL maintainer="${MAINTAINER}"
LABEL version="${VERSION}" 
LABEL description="${DESCRIPTION}"



# SET Environment Variable  DEBIAN_FRONTEND to proceed with package installations without any user input.
ENV DEBIAN_FRONTEND=${DEBIAN_FRONTEND}


# Update package list.
# Install following components/packages.
# build-essential (like GCC and other libraries) - Required for rust.
# curl - Required to download packages.
# git - Required to clone source code of zsh plug-in's.
# iputils-ping - Required to test network connectivity (optional). 
# locales - Required to set Language, Character Encoding and other locales to Indian.
# tzdata - Required to set time-zone to Asia/Kolkata.
# zsh - Interactive zsh shell which supports command history, auto-complete features.
# Generate the locale data for en_IN.UTF-8 and update the system configuration for en_IN.UTF-8.
# (Had error, if locale data is not generated, So generating from here).
# Disable "detached HEAD" warning messages using git config command.
# Set default shell to ZSH (Z Shell).

RUN apt-get update && \ 
    apt-get install -y build-essential curl git iputils-ping lldb locales tzdata zsh && \
    locale-gen en_IN.UTF-8 && \ 
    update-locale LANG=en_IN.UTF-8 && \
    git config --global advice.detachedHead false && \
    chsh -s /user/bin/zsh 


# Install oh-my-zsh plugin manager for zsh
RUN zsh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Download and install zsh-autosuggestions plugin
RUN zsh -c 'git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions'

# Download & install zsh-syntax-highlighting plugin
RUN zsh -c 'git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting'

# Give Write permission to zshrc. 
# 644 - owner can read/write, group/others can read only
RUN chmod 644 ~/.zshrc

# To remove error -  zsh: can't rename /root/.zsh_history.new to $HISTFILE,
# HIST_SAVE_BY_COPY is unset, so zsh will not save command history to file 'zsh_history.new'.
# Note : zsh stores command history to temp file zsh_history.new and then on exit after renaming this file.
RUN echo 'unsetopt HIST_SAVE_BY_COPY' >> ~/.zshrc

# Below options are tried to remove error but not working.
#RUN echo 'setopt APPEND_HISTORY' >> /root/.zshrc
#RUN zsh export HISTFILE=/tmp/.zsh_history
#RUN echo 'setopt HIST_IGNORE_DUPS' >> /root/.zshrc
#RUN echo 'setopt HIST_FCNTL_LOCK' >> /root/.zshrc

# Install vim & xterm 
# --no-install-recommends flag is used here while installing vim and xterm 
#  because subsequent RUN commands are failing if this flag is used while installing build-essential, curl , git etc.
RUN apt-get update && \ 
    apt-get install --no-install-recommends -y  vim xterm


# Environment Variables
# Set environment variables for locales
# Set system language, character encoding and time zone.
# LC_ALL overrides Locale Settings. This is set explicitly because it had error if not set.
# This ensures that the programs and services running within the container handle language, 
# character encoding, and cultural formatting correctly. Time Zone is also set.


ENV LANG=${LANG}
ENV LANGUAGE=${LANGUAGE}
ENV LC_ALL=${LC_ALL}
ENV TZ=${TZ}

# To Set default text editor.
ENV EDITOR=${EDITOR}

# To Set the default terminal type.
ENV TERM=${TERM}


# Install RUST

# Define the variable to store working directory (workspace).
ARG WORK_DIR="user/workspace"


# Define the variable to store programs/projects working directory.
ARG RUST_DIR="rust_programs"


# Create a directory to use as working directory.
RUN mkdir -p "${WORK_DIR}/${RUST_DIR}"
#RUN mkdir -p "${RUST_DIR}"

# Set the working directory.
#WORKDIR "${WORK_DIR}"
WORKDIR "${WORK_DIR}/${RUST_DIR}"

# Copy the rustup-init.sh script to working directory i.e. WORKDIR i.e. workspace.
# rustup-init.sh script is used to install rust.
# downloaded from https://github.com/rust-lang/rustup/blob/master/rustup-init.sh

ADD rustup-init.sh "${WORK_DIR}/${RUST_DIR}/rustup-init.sh"

# Give execute permission to rustup-init.sh.
RUN chmod +x "${WORK_DIR}/${RUST_DIR}/rustup-init.sh"

# Run the script to install rust.
RUN "${WORK_DIR}/${RUST_DIR}/rustup-init.sh" -y

# Add cargo-bin to PATH
# Modify the PATH environment variable within the Docker image to include the /root/.cargo/bin directory. 
# So that the commands executed using cargo are accessible and executable within the container.
# This PATH is set using hardcoded value because it had error if set through .env file.
ENV PATH="/root/.cargo/bin:${PATH}"
  
# Install rustup components which are necessary but not installed by-default by rustup-init.sh.
RUN rustup component add rust-analyzer && \
    rustup component add rust-src


# Clean local repository cache and remove automatically installed packages which are no longer needed.
# This will reduce size of the image.
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* &&\
    apt-get autoremove -y



# Make the container running contineously.
ENTRYPOINT ["/bin/zsh", "-c", "while true; do sleep 300; done"]

# Echo the message that , "Rust Development Container' image built successfully!".
RUN echo "'Rust Development Container' image built successfully!"