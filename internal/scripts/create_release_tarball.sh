#!/bin/bash

# Check if running from repository root
if [ ! -f "MODULE.bazel" ]; then
    echo "Error: This script must be run from the repository root directory"
    echo "Expected file MODULE.bazel not found in current directory"
    exit 1
fi

# Check if version parameter is provided
if [ -z "$1" ]; then
    echo "Usage: $0 <version>"
    echo "Example: $0 1.0.0"
    exit 1
fi

version="$1"
tarball_name="openapi-generator-bazel-v${version}.tar.gz"

# Create tarball with specific files in a subdirectory
temp_dir="openapi-generator-bazel-${version}"
mkdir -p "$temp_dir/internal/test/bcr"

# Copy files to temp directory
cp BUILD.bazel "$temp_dir/"
cp LICENSE "$temp_dir/"
cp MODULE.bazel "$temp_dir/"
cp MODULE.bazel.lock "$temp_dir/"
cp defs.bzl "$temp_dir/"
cp extension.bzl "$temp_dir/"
cp internal/openapi_generator.bzl "$temp_dir/internal/"
cp internal/BUILD.bazel "$temp_dir/internal/"
cp internal/test/bcr/petstore.yaml "$temp_dir/internal/test/bcr/"
cp internal/test/bcr/config.yaml "$temp_dir/internal/test/bcr/"
cp internal/test/bcr/BUILD "$temp_dir/internal/test/bcr/"
cp internal/test/bcr/MODULE.bazel.lock "$temp_dir/internal/test/bcr/"
cp internal/test/bcr/MODULE.bazel "$temp_dir/internal/test/bcr/"

# Create tarball from temp directory (list files explicitly to avoid intermediate directories)
tar czf "$tarball_name" -C . \
    "$temp_dir/BUILD.bazel" \
    "$temp_dir/LICENSE" \
    "$temp_dir/MODULE.bazel" \
    "$temp_dir/MODULE.bazel.lock" \
    "$temp_dir/defs.bzl" \
    "$temp_dir/extension.bzl" \
    "$temp_dir/internal/openapi_generator.bzl" \
    "$temp_dir/internal/BUILD.bazel" \
    "$temp_dir/internal/test/bcr/petstore.yaml" \
    "$temp_dir/internal/test/bcr/config.yaml" \
    "$temp_dir/internal/test/bcr/BUILD" \
    "$temp_dir/internal/test/bcr/MODULE.bazel.lock" \
    "$temp_dir/internal/test/bcr/MODULE.bazel"

# Clean up temp directory
rm -rf "$temp_dir"

echo "Created tarball: $tarball_name"