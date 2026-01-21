FROM ubuntu:22.04

# Avoid prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Install LLVM, Clang, CMake, and build tools
RUN apt-get update && apt-get install -y \
    llvm \
    clang \
    cmake \
    build-essential \
    vim \
    nano \
    git \
    && rm -rf /var/lib/apt/lists/*

# Set the working directory inside the container
WORKDIR /llvm-learning

CMD ["bash"]