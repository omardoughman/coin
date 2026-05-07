#!/bin/bash

# --- BREW CHECK ---
if ! command -v brew &> /dev/null; then
    echo "❌ ERROR: Install Brew at https://brew.sh/"
    exit 1
fi

# --- INSTALL ---
brew install git cmake protobuf openjdk

# --- REPO SETUP ---
if [ ! -d "coin" ]; then
    git clone https://github.com/omardoughman/coin.git
    cd coin
fi

# --- BUILD C ENGINE ---
mkdir -p build
cd build
cmake ..
make # This creates a standalone 'coin_engine' executable
cd ..

# --- BUILD JAVA ---
javac main.java needed.java package.java

# --- LAUNCH BOTH ---
echo "🚀 Launching Parallel Systems..."
./build/coin_engine &  # Start C in background
java main &           # Start Java in foreground
