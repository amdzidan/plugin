#!/bin/bash
# Double-click (or run in Terminal) on your Apple Silicon Mac.
# Builds RVRS and installs the VST3 + AU. Then rescan plug-ins in Ableton.
set -e
cd "$(dirname "$0")"

if ! xcode-select -p >/dev/null 2>&1; then
  echo "Installing Xcode command line tools... re-run this script when it finishes."
  xcode-select --install
  exit 1
fi
if ! command -v cmake >/dev/null 2>&1; then
  if command -v brew >/dev/null 2>&1; then brew install cmake
  else echo "Install CMake first: https://cmake.org/download/ (or install Homebrew)"; exit 1; fi
fi

cmake -B build -DCMAKE_BUILD_TYPE=Release -DRVRS_INSTALL_AFTER_BUILD=ON
cmake --build build --config Release -j 8

xattr -cr ~/Library/Audio/Plug-Ins/VST3/RVRS.vst3 2>/dev/null || true
xattr -cr ~/Library/Audio/Plug-Ins/Components/RVRS.component 2>/dev/null || true
echo ""
echo "Done. RVRS.vst3 is in ~/Library/Audio/Plug-Ins/VST3"
echo "In Ableton: Preferences > Plug-Ins > rescan."
