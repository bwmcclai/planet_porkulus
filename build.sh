#!/bin/bash
# Build script for Amazonia mod

MOD_NAME="porkulus"
VERSION="1.1.0"
BUILD_DIR="${MOD_NAME}_${VERSION}"
ZIP_NAME="${BUILD_DIR}.zip"
DEST="$HOME/Library/Application Support/factorio/mods/${ZIP_NAME}"

# Clean up
rm -rf "/tmp/${BUILD_DIR}"
rm -f "$DEST"

# Create build directory
mkdir -p "/tmp/${BUILD_DIR}"

# Copy files
cp -r /Users/bmac/FACTORIO/Porkulus/* "/tmp/${BUILD_DIR}/"

# Remove unwanted files
find "/tmp/${BUILD_DIR}" -name ".DS_Store" -delete
find "/tmp/${BUILD_DIR}" -name ".git" -type d -exec rm -rf {} + 2>/dev/null

# Create ZIP
cd /tmp
zip -r "$DEST" "${BUILD_DIR}" -x "*.DS_Store" -x "*/.git/*"

# Cleanup
rm -rf "/tmp/${BUILD_DIR}"

echo "✓ Mod built successfully: $DEST"
ls -lh "$DEST"
