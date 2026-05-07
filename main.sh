#!/bin/bash

# --- PRE-FLIGHT CHECK ---
echo "🔍 Checking for Homebrew..."
if ! command -v brew &> /dev/null
then
    echo "❌ ERROR: Homebrew is not installed."
    echo "⚠️  You must install Homebrew from https://brew.sh/ first, otherwise this command will fail."
    exit 1
fi

echo "✅ Homebrew found. Proceeding with dependency check..."

# --- INSTALL DEPENDENCIES ---
echo "📥 Installing required tools (cmake, protobuf, nanopb)..."
brew install cmake protobuf
# Note: Nanopb is usually handled as a submodule or local files, 
# but we ensure the environment is ready for it.

# --- DIRECTORY SETUP ---
echo "📂 Setting up environment..."
mkdir -p build
touch main.codec su.codec needed.codec

# --- COMPILATION ---
echo "📦 Compiling Protocol Buffers..."
# Using the flat structure we planned
protoc --nanopb_out=. main.proto

echo "🔗 Linking Java and C++ via CMake..."
cd build
cmake ..
make
cd ..

# --- LAUNCH ---
echo "🚀 Build Complete. Starting Coin Bridge..."
python3 main.py
