#!/usr/bin/env bash

# environment isolation
export PYTHONNOUSERSITE=1
unset PYTHONPATH
unset PYTHONHOME

cd "$(dirname "${BASH_SOURCE[0]}")"

# Portable install case
if [ -d "portable_env" ]; then
    ./portable_env/bin/python3 server.py --portable --api --auto-launch "$@"
    exit $?
fi

if [[ "$(pwd)" =~ " " ]]; then echo This script relies on Miniforge which can not be silently installed under a path with spaces. && exit; fi

# deactivate existing conda envs as needed to avoid conflicts
{ conda deactivate && conda deactivate && conda deactivate; } 2> /dev/null

OS_ARCH=$(uname -m)
case "${OS_ARCH}" in
    x86_64*)    OS_ARCH="x86_64";;
    arm64*)     OS_ARCH="aarch64";;
    aarch64*)     OS_ARCH="aarch64";;
    *)          echo "Unknown system architecture: $OS_ARCH! This script runs only on x86_64 or arm64" && exit
esac

# config
INSTALL_DIR="$(pwd)/installer_files"
CONDA_ROOT_PREFIX="$(pwd)/installer_files/conda"
INSTALL_ENV_DIR="$(pwd)/installer_files/env"
MINIFORGE_DOWNLOAD_URL="https://github.com/conda-forge/miniforge/releases/download/25.3.0-3/Miniforge3-25.3.0-3-Linux-${OS_ARCH}.sh"
conda_exists="F"

# figure out whether git and conda needs to be installed
if "$CONDA_ROOT_PREFIX/bin/conda" --version &>/dev/null; then conda_exists="T"; fi

# (if necessary) install git and conda into a contained environment
# download miniforge
if [ "$conda_exists" == "F" ]; then
    echo "Downloading Miniforge from $MINIFORGE_DOWNLOAD_URL to $INSTALL_DIR/miniforge_installer.sh"

    mkdir -p "$INSTALL_DIR"
    curl -L "$MINIFORGE_DOWNLOAD_URL" > "$INSTALL_DIR/miniforge_installer.sh"

    chmod u+x "$INSTALL_DIR/miniforge_installer.sh"
    bash "$INSTALL_DIR/miniforge_installer.sh" -b -p $CONDA_ROOT_PREFIX

    # test the conda binary
    echo "Miniforge version:"
    "$CONDA_ROOT_PREFIX/bin/conda" --version

    # delete the Miniforge installer
    rm "$INSTALL_DIR/miniforge_installer.sh"
fi

# create the installer env
if [ ! -e "$INSTALL_ENV_DIR" ]; then
    "$CONDA_ROOT_PREFIX/bin/conda" create -y -k --prefix "$INSTALL_ENV_DIR" python=3.11
fi

# check if conda environment was actually created
if [ ! -e "$INSTALL_ENV_DIR/bin/python" ]; then
    echo "Conda environment is empty."
    exit
fi

export CUDA_PATH="$INSTALL_ENV_DIR"
export CUDA_HOME="$CUDA_PATH"

# activate installer env
source "$CONDA_ROOT_PREFIX/etc/profile.d/conda.sh" # otherwise conda complains about 'shell not initialized' (needed when running in a script)
conda activate "$INSTALL_ENV_DIR"

# setup installer env
python one_click.py $@