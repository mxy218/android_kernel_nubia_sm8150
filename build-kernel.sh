#!/bin/bash
starttime=`date +'%Y-%m-%d %H:%M:%S'`
#执行程序
#####  build kernel script  #####
KERNEL_CONFIG=vendor/sm8150-NX627J-perf_defconfig
KERNEL_ARCH=arm64
KERNEL_HEADER_ARCH=arm64
export HEADER_ARCH=arm64
#####  set environment  #####
KERNEL_OUT=out
if [ $(uname -m) == x86_64 ]; then
#CLANG=/usr/bin
CLANG=/home/mxy/android/android_source/los18.1/prebuilts/clang/host/linux-x86/clang-r383902b/bin
KERNEL_CROSS_COMPILE=/home/mxy/android/android_source/los18.1/prebuilts/gcc/linux-x86/aarch64/aarch64-linux-android-4.9/bin/aarch64-linux-android-

fi

make  O=$KERNEL_OUT CC=$CLANG/clang ARCH=$KERNEL_HEADER_ARCH CLANG_TRIPLE=aarch64-linux-gnu- CROSS_COMPILE=$KERNEL_CROSS_COMPILE $KERNEL_CONFIG
make  O=$KERNEL_OUT CC=$CLANG/clang ARCH=$KERNEL_HEADER_ARCH CLANG_TRIPLE=aarch64-linux-gnu- CROSS_COMPILE=$KERNEL_CROSS_COMPILE headers_install
make  O=$KERNEL_OUT CC=$CLANG/clang ARCH=$KERNEL_HEADER_ARCH CLANG_TRIPLE=aarch64-linux-gnu- CROSS_COMPILE=$KERNEL_CROSS_COMPILE -j 8


endtime=`date +'%Y-%m-%d %H:%M:%S'`
start_seconds=$(date --date="$starttime" +%s);
end_seconds=$(date --date="$endtime" +%s);
echo "本次运行时间： "$(((end_seconds-start_seconds)/60))m $(((end_seconds-start_seconds)%60))"s"


