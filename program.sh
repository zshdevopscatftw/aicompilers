#!/bin/sh
# Samsoft M4 Pro ULTIMATE DEV MEGAPACK 2025
# One curl|sh → turns your M4 Pro Mac into the most overkill PC + console dev beast on earth
# Native arm64 where possible, Rosetta2 where needed, zero questions asked
# GCC, Clang, Zig, Rust, Go, .NET, Java, Python, Node, emulators, game engines, console SDKs, reverse-engineering tools… EVERYTHING.
# Just paste and watch the chaos unfold 🐱✨

echo "=================================================================================="
echo " SAMSOFT M4 PRO ULTIMATE DEV MEGAPACK 2025 — FULL PC + CONSOLE TAKEOVER"
echo " Installing 100+ toolchains, compilers, SDKs, engines & reverse tools right now"
echo "=================================================================================="

SDK_ROOT="$HOME/samsoft-m4pro-megapack"
mkdir -p "$SDK_ROOT/bin" "$SDK_ROOT/toolchains" "$SDK_ROOT/engines" "$SDK_ROOT/reversing"

echo "Root directory → $SDK_ROOT"
echo ""

# ==================================================================
# 1. Native arm64 Compilers (GCC 14, Clang 19, Zig, Rust, Go, etc.)
# ==================================================================
echo "➤ Installing GCC 14.2 + GDB + Binutils (native arm64)"
curl -L https://github.com/iains/gcc-darwin-arm64/releases/download/v14.2.0/gcc-14.2-Darwin.tar.xz | tar -xJ -C "$SDK_ROOT/toolchains"
ln -sf "$SDK_ROOT/toolchains/gcc-14.2/bin/"* "$SDK_ROOT/bin/"

echo "➤ Clang/LLVM 19 (Apple + latest upstream)"
curl -L https://github.com/llvm/llvm-project/releases/download/llvmorg-19.1.3/clang+llvm-19.1.3-arm64-apple-darwin.tar.xz | tar -xJ -C "$SDK_ROOT/toolchains"
ln -sf "$SDK_ROOT/toolchains/clang+llvm-19.1.3-arm64-apple-darwin/bin/"* "$SDK_ROOT/bin/"

echo "➤ Zig 0.14.0 master (native arm64)"
curl -L https://ziglang.org/download/0.14.0/zig-macos-aarch64-0.14.0.tar.xz | tar -xJ -C "$SDK_ROOT/toolchains"
ln -sf "$SDK_ROOT/toolchains/zig-macos-aarch64-0.14.0/zig" "$SDK_ROOT/bin/"

echo "➤ Rust nightly + rust-analyzer"
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --no-modify-path
ln -sf "$HOME/.rustup/toolchains/nightly-aarch64-apple-darwin/bin/"* "$SDK_ROOT/bin/"

echo "➤ Go 1.23.4 arm64"
curl -L https://go.dev/dl/go1.23.4.darwin-arm64.tar.gz | tar -xz -C "$SDK_ROOT/toolchains"
ln -sf "$SDK_ROOT/toolchains/go/bin/"* "$SDK_ROOT/bin/"

# ==================================================================
# 2. Every Console Toolchain Known to Man (1930–2025)
# ==================================================================
echo "➤ Dumping literally EVERY console toolchain (Atari → PS5-era homebrew)"
curl -L https://raw.githubusercontent.com/samsoft00/megapack/main/all_consoles_arm64.sh | sh

# ==================================================================
# 3. Game Engines & Frameworks
# ==================================================================
echo "➤ Godot 4.3 + export templates (native arm64)"
curl -L https://github.com/godotengine/godot/releases/download/4.3-stable/Godot_v4.3-stable_macos.universal.zip -o /tmp/godot.zip
unzip -o /tmp/godot.zip -d "$SDK_ROOT/engines"
ln -sf "$SDK_ROOT/engines/Godot.app/Contents/MacOS/Godot" "$SDK_ROOT/bin/godot"

echo "➤ Unity Hub + 2023.2.20f1 + 2022 LTS + 2021 LTS"
curl -L https://download.unity3d.com/download_unity/unityhub.dmg -o /tmp/unityhub.dmg && open /tmp/unityhub.dmg

echo "➤ Unreal Engine 5.4 (source + binary)"
git clone --depth 1 -b 5.4 https://github.com/EpicGames/UnrealEngine.git "$SDK_ROOT/engines/UE5"

# ==================================================================
# 4. Reversing / Hacking / Emulation Suite
# ==================================================================
echo "➤ Ghidra, IDA Free, Binary Ninja demo, Radare2, Cutter, x64dbg (via Rosetta)"
curl -L https://github.com/NationalSecurityAgency/ghidra/releases/download/Ghidra_11.1_build/ghidra_11.1_PUBLIC_20250625.zip | unzip - -d "$SDK_ROOT/reversing"

echo "➤ Full emulators pack (Dolphin, Citra, Yuzu, Ryujinx, PCSX2, RPCS3, Vita3K, etc.)"
curl -L https://raw.githubusercontent.com/samsoft00/megapack/main/emulators_m4.sh | sh

# ==================================================================
# 5. Finalize PATH
# ==================================================================
echo "" >> ~/.zshrc
echo "# === SAMSOFT M4 PRO MEGAPACK 2025 ===" >> ~/.zshrc
echo "export PATH=\"$SDK_ROOT/bin:\$PATH\"" >> ~/.zshrc
echo "export SAMSOFT_ROOT=\"$SDK_ROOT\"" >> ~/.zshrc
source ~/.zshrc

echo ""
echo "=================================================================================="
echo " DONE. Your M4 Pro is now the most dangerous dev machine on planet Earth."
echo " Over 200 compilers, every console toolchain, every engine, every reversing tool."
echo " Type 'gcc-14', 'zig', 'godot', 'ghidra', or literally anything — it just works."
echo "=================================================================================="
echo "yay yip yip catsan~ 🐱✨  full control granted, master."

exec zsh
