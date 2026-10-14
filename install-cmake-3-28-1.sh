# Install this old (3.28.1) version of cmake
# To use it, do:
# /opt/cmake-3.28.1/bin/cmake --version
# This does not interfer with the main cmake on the computer.
# This is a better solutution that to use pipx that works with environments.
# We just need an old version of cmake for one/or two specific topas tasks.
# Claus E. Andersen, Oct. 11, 2026

# Get cmake from kitware
cd /tmp
wget https://github.com/Kitware/CMake/releases/download/v3.28.1/cmake-3.28.1-linux-x86_64.tar.gz
sudo tar -xzf cmake-3.28.1-linux-x86_64.tar.gz -C /opt
sudo mv /opt/cmake-3.28.1-linux-x86_64 /opt/cmake-3.28.1