#!/usr/bin/env bash
set -euo pipefail

# download version
curl -s -L -o "version.tar.gz" https://android.googlesource.com/platform/tools/buildSrc/+archive/refs/heads/studio-main/base.tar.gz
tar -xf "version.tar.gz" "version.properties"
mv "version.properties" "gradle.properties"

# download source
curl -s -L -o "source.tar.gz" https://android.googlesource.com/platform/tools/base/+archive/refs/heads/studio-main/vector-drawable-tool.tar.gz
mkdir -p tools/base/vector-drawable-tool
tar -xf source.tar.gz --directory tools/base/vector-drawable-tool

# build bundle
gradle :tools:base:vector-drawable-tool:assembleDist --no-daemon

# build native
# gradle :tools:base:vector-drawable-tool:nativeCompile --no-daemon