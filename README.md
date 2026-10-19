# RVRS — reverse texture plugin (Apple Silicon, AU + VST3)

Put it on a vocal/guitar/any audio track. It listens to the audio passing
through, finds strong moments in each phrase, randomly picks one, reverses it,
and plays it back as a one-shot reverse effect after the phrase ends.

## Controls
- **TEXTURE**: adds noise, grit (saturation + crunch) and reverb.
- **CHARACTER**: short/dark/tight on the left -> long/bright/swelling on the right.
- **Click the logo**: re-roll a different random slice from the last phrase.

## Option A: build in the cloud (no Xcode)
1. Create a free GitHub account and a new private repo, upload this folder.
2. Actions tab -> "Build RVRS (Apple Silicon)" -> Run workflow.
3. Download the artifact, unzip, then in Terminal:
   `xattr -cr ~/Downloads/RVRS.vst3 ~/Downloads/RVRS.component`
4. Move `RVRS.vst3` to `~/Library/Audio/Plug-Ins/VST3/` (or `RVRS.component` to `~/Library/Audio/Plug-Ins/Components/`).

## Option B: build locally (easiest if you have a Mac handy)
Double-click `build_mac.command` (right-click > Open the first time). It installs
what it needs, builds, installs the VST3 and AU, and tells you when to rescan.
Manual version:
```
xcode-select --install
brew install cmake
cd RVRS
cmake -B build -DCMAKE_BUILD_TYPE=Release
cmake --build build --config Release -j 8
```
It auto-copies into your Plug-Ins folders.

## In Ableton Live
Preferences -> Plug-Ins -> enable VST3 (and/or AU) -> Rescan. Find RVRS under Plug-ins.
Drop it on the audio track after your sample.

## Notes
- A reverse can only use audio that already played, so the reversed shot
  fires ~150 ms after the phrase ends (it fills the gap/tail).
- Source has not been compile-tested in my environment; if the build errors,
  send me the log and I'll fix it.
