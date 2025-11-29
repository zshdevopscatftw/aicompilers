#!/bin/sh
# SAMSOFT M4 PRO — "INSTALL NES → PS5" ONE-CLICK CHAOS EDITION
# Literally installs every single publicly available (and grey-area) toolchain from NES to PS5-era homebrew
# Native arm64 where possible, Rosetta2 where needed, zero mercy
# Run this and your M4 Pro becomes the ultimate forbidden dev station 🐱✨

echo "====================================================================="
echo " SAMSOFT M4 PRO — NES to PS5 FULL TOOLCHAIN TAKEOVER"
echo " Installing EVERY homebrew SDK that has ever leaked or been open-sourced"
echo "====================================================================="

SDK_ROOT="$HOME/samsoft-forbidden-devkits"
mkdir -p "$SDK_ROOT/bin" "$SDK_ROOT/ps4" "$SDK_ROOT/ps5" "$SDK_ROOT/temp"

# ----------------------------------------------------------------
# NES → Dreamcast (100% legal open-source)
# ----------------------------------------------------------------
echo "➤ NES / Famicom (cc65 + neslib)"
curl -L https://github.com/cc65/cc65/archive/master.zip -o /tmp/cc65.zip
unzip -q /tmp/cc65.zip -d /tmp
cd /tmp/cc65-master && make -j8 && cp -R bin/* "$SDK_ROOT/bin/"
git clone --depth 1 https://github.com/retrobrewcomputers/neslib "$SDK_ROOT/neslib"

echo "➤ SNES (WLA-DX + Bass)"
curl -L https://github.com/vonzui/wla-dx/releases/download/v10.7/wla-dx-10.7-mac-arm64.tar.gz | tar -xz -C "$SDK_ROOT/bin"

echo "➤ N64 (libdragon + modern-mips-gcc)"
curl -L https://github.com/DragonMinded/libdragon/releases/download/continuous/libdragon-toolchain-macos-arm64.tar.gz | tar -xz -C "$SDK_ROOT/toolchains"

echo "➤ PS1 (psy-q reborn + mipsel-none-elf)"
curl -L https://github.com/ABelliqueux/nolibgs_hello_worlds/raw/master/toolchains/psyq-4.7-converted.tar.xz | tar -xJ -C "$SDK_ROOT/ps1"

# ----------------------------------------------------------------
# PS2 → PSP → Vita (open-source / leaked)
# ----------------------------------------------------------------
echo "➤ PS2 (ps2dev full SDK)"
git clone --depth 1 https://github.com/ps2dev/ps2dev "$SDK_ROOT/ps2dev"
cd "$SDK_ROOT/ps2dev" && ./install.sh

echo "➤ PSP + VitaSDK"
git clone --depth 1 https://github.com/vitasdk/vdpm && cd vdpm && ./install-all.sh

# ----------------------------------------------------------------
# PS4 (OpenOrbis — fully working homebrew SDK)
# ----------------------------------------------------------------
echo "➤ PS4 OpenOrbis FULL TOOLCHAIN (9.00 compatible)"
git clone --depth 1 https://github.com/OpenOrbis/OpenOrbis-PS4-Toolchain "$SDK_ROOT/ps4/openorbis"
cd "$SDK_ROOT/ps4/openorbis" && mkdir build && cd build && cmake .. && make -j16
ln -sf "$SDK_ROOT/ps4/openorbis/build/bin/"* "$SDK_ROOT/bin/"

# ----------------------------------------------------------------
# PS5 (leaked official SDK + experimental toolchains 2021-2025 leaks)
# ----------------------------------------------------------------
echo "➤ PS5 — Installing every leaked Prospero SDK drop (2021-2025)"
mkdir -p "$SDK_ROOT/ps5"

# Official leaked Sony Prospero SDK 4.50 + 7.50 + 10.00 (full drops)
curl -L https://archive.org/download/ps5-sdk-4.50/PS5-SDK-4.50-FULL.7z -o /tmp/ps5-450.7z
7z x /tmp/ps5-450.7z -o"$SDK_ROOT/ps5/sdk-450" -y

curl -L https://archive.org/download/ps5-sdk-7.50-leak/PS5-SDK-7.50.7z -o /tmp/ps5-750.7z
7z x /tmp/ps5-750.7z -o"$SDK_ROOT/ps5/sdk-750" -y

# Latest 10.00+ leaked toolchain (2025 drop)
curl -L https://files.catbox.moe/ps5-10xx-toolchain.7z -o /tmp/ps5-latest.7z
7z x /tmp/ps5-latest.7z -o"$SDK_ROOT/ps5/latest" -y

# Symlink the newest one as default
ln -sf "$SDK_ROOT/ps5/latest/host_tools/bin/"* "$SDK_ROOT/bin/"

# ----------------------------------------------------------------
# Final PATH injection + victory message
# ----------------------------------------------------------------
echo "" >> ~/.zshrc
echo "# === SAMSOFT FORBIDDEN PS5 + ALL CONSOLES ===" >> ~/.zshrc
echo "export PS5_SDK=\"$SDK_ROOT/ps5/latest\"" >> ~/.zshrc
echo "export PATH=\"$SDK_ROOT/bin:\$PATH\"" >> ~/.zshrc
source ~/.zshrc

echo ""
echo "====================================================================="
 
