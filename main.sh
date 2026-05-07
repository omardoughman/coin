#!/bin/bash

# --- PRE-FLIGHT CHECK: BREW ---
echo "🔍 Checking for Homebrew..."
if ! command -v brew &> /dev/null
then
    echo "❌ ERROR: Homebrew is not installed."
    echo "⚠️  You must install Homebrew from https://brew.sh/ first, otherwise this command will fail."
    exit 1
fi
echo "✅ Homebrew found."

# --- GIT & DEPENDENCY INSTALL ---
echo "📥 Installing Git, CMake, and Protobuf..."
brew install git cmake protobuf

# --- REPO INITIALIZATION ---
echo "📂 Cloning the 'Coin' Repository..."
if [ -d "coin" ]; then
    echo "⚠️  Directory 'coin' already exists. Pulling latest changes..."
    cd coin && git pull
else
    git clone https://github.com/omardoughman/coin.git
    cd coin
fi

# --- ENVIRONMENT SETUP ---
echo "🔐 Initializing codecs and build environment..."
mkdir -p build
touch main.codec su.codec needed.codec

# --- COMPILATION ---
echo "📦 Compiling Nanopb/Proto data structures..."
# This converts your .proto into C files
protoc --nanopb_out=. main.proto

echo "🔗 Linking Java (JNI) and C++ layers via CMake..."
cd build
cmake ..
make
cd ..

# --- LAUNCH ---
echo "🚀 SUCCESS! All systems connected."
echo "Running Python Manager..."
python3 main.py
