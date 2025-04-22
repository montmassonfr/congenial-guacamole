#!/bin/bash

# Set script to exit on error
set -e

# Configuration
BASE_DIR="deepzip"
DEPTH=50
ZIP_NAME="deepzip-example.zip"

# Clean up any previous run
rm -rf "$BASE_DIR" "$ZIP_NAME"

# Create base directory
mkdir -p "$BASE_DIR"
cd "$BASE_DIR"

# Create deep directory structure
PATH_PREFIX=""
for i in $(seq -w 1 $DEPTH); do
  PATH_PREFIX="$PATH_PREFIX/$i"
  mkdir -p ".$PATH_PREFIX"
done

# Create a file at the deepest level
echo "Hello from the deep!" > ".$PATH_PREFIX/deepfile.txt"

# Move back up and create the zip
cd ..
zip -r "$ZIP_NAME" "$BASE_DIR"

echo "✅ Created $ZIP_NAME with a $DEPTH-level deep structure."

