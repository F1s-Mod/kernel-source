
#sudo apt-get update
#sudo apt-get install -y build-essential bc curl git zip ftp gcc-aarch64-linux-gnu gcc-arm-linux-gnueabi libssl-dev lftp zstd wget libfl-dev python3 libarchive-tools device-tree-compiler zsh

#git clone https://github.com/1ndev-ui/android_prebuilts_clang_host_linux-x86_clang-6443078 -b 11.0.1 ../clang --depth=1
#git clone https://android.googlesource.com/platform/prebuilts/gas/linux-x86 -b master ../gas --depth=1

DEFCONFIG="RMX2195_defconfig"
ARCH=arm64
CROSS_COMPILE=aarch64-linux-gnu-
CROSS_COMPILE_ARM32=arm-linux-gnueabi-
CROSS_COMPILE_COMPAT=arm-linux-gnueabi-
CLANG_TRIPLE=aarch64-linux-gnu-
AR=
CC=clang

GAS="$(pwd)/../gas"
TC_DIR="$(pwd)/../clang"
export PATH="$TC_DIR/bin:$PATH:$TC_DIR/:$PATH:$GAS/bin:$PATH:$GAS/:$PATH"

mkdir -p out
make O=out ARCH=arm64 CC=clang AR= CROSS_COMPILE=aarch64-linux-gnu- CROSS_COMPILE_ARM32=arm-linux-gnueabi- CROSS_COMPILE_COMPAT=arm-linux-gnueabi- CROSS_COMPILE_ARM32=arm-linux-gnueabi-  CLANG_TRIPLE=aarch64-linux-gnu- $DEFCONFIG
make -j$(nproc --all) O=out ARCH=arm64 CC=clang AR= CROSS_COMPILE=aarch64-linux-gnu- CROSS_COMPILE_ARM32=arm-linux-gnueabi- CROSS_COMPILE_COMPAT=arm-linux-gnueabi- CROSS_COMPILE_ARM32=arm-linux-gnueabi-  CLANG_TRIPLE=aarch64-linux-gnu- CONFIG_DEBUG_SECTION_MISMATCH=y
