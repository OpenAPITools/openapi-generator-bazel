#!/bin/bash

# Check if version parameter is provided
if [ -z "$1" ]; then
    echo "Usage: $0 <version>"
    echo "Example: $0 1.0.0"
    exit 1
fi

version="$1"
tarball_name="openapi-generator-bazel-v${version}.tar.gz"

# Create tarball excluding git files, bazel-* symlinks, and other unwanted files
tar -czf "$tarball_name" \
    --exclude='.git*' \
    --exclude='bazel-*' \
    --exclude='*.tar.gz' \
    .

echo "Created tarball: $tarball_name"