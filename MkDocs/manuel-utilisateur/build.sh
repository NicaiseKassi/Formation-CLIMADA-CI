#!/bin/bash

# Build script for Vercel
echo "Starting build process..."

# Install dependencies
echo "Installing Python dependencies..."
python3 -m pip install -r requirements.txt

# Check if mkdocs is available
if ! command -v mkdocs &> /dev/null; then
    echo "mkdocs not found in PATH, trying python -m mkdocs..."
    python3 -c "import mkdocs; print('MkDocs imported successfully')"
    python3 -m mkdocs build
else
    echo "Using mkdocs command..."
    mkdocs build
fi

echo "Build completed!"