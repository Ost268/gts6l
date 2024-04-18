#!/bin/bash


export KBUILD_BUILD_USER=ykkfive
export KBUILD_BUILD_HOST=yTabS6
export LOCALVERSION="-`basename $(pwd)`"


export ARCH=arm64
mkdir out

BUILD_CROSS_COMPILE=/opt1/android/toolchain/gcc/aarch64-linux-android-4.9/bin/aarch64-linux-android-
KERNEL_LLVM_BIN=/opt1/android/toolchain/clang/clang/bin/clang
CLANG_TRIPLE=aarch64-linux-gnu-
KERNEL_MAKE_ENV="DTC_EXT=$(pwd)/tools/dtc CONFIG_BUILD_ARM64_DT_OVERLAY=y"

make -j8 -C $(pwd) O=$(pwd)/out $KERNEL_MAKE_ENV ARCH=arm64 CROSS_COMPILE=$BUILD_CROSS_COMPILE REAL_CC=$KERNEL_LLVM_BIN CLANG_TRIPLE=$CLANG_TRIPLE gts6lwifi_eur_open_defconfig
make -j8 -C $(pwd) O=$(pwd)/out $KERNEL_MAKE_ENV ARCH=arm64 CROSS_COMPILE=$BUILD_CROSS_COMPILE REAL_CC=$KERNEL_LLVM_BIN CLANG_TRIPLE=$CLANG_TRIPLE
 
#cp out/arch/arm64/boot/Image $(pwd)/arch/arm64/boot/Image
cp out/arch/arm64/boot/out/Image.gz-dtb out/arch/arm64/boot/out/zImage
echo -n "SEANDROIDENFORCE" >> out/arch/arm64/boot/out/zImage
