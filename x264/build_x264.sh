#!/bin/bash
export ANDROID_NDK=/home/ubuntu/usr/ndk/android-ndk-r10e
PREFIX=$(pwd)/android/arm
SYSROOT=$ANDROID_NDK/platforms/android-9/arch-arm
CROSS_PREFIX=$ANDROID_NDK/toolchains/arm-linux-androideabi-4.8/prebuilt/linux-x86_64/bin/arm-linux-androideabi-
EXTRA_CFLAGS="-march=armv7-a -mfloat-abi=softfp -mfpu=neon -D__ARM_ARCH_7__ -D__ARM_ARCH_7A__"
EXTRA_LDFLAGS="-nostdlib"
./configure --prefix=$PREFIX \
--cross-prefix=$CROSS_PREFIX \
--extra-cflags="$EXTRA_CFLAGS" \
--extra-ldflags="$EXTRA_LDFLAGS" \
--enable-pic \
--enable-strip \
--disable-cli \
--host=arm-linux \
--sysroot=$SYSROOT \
--enable-shared
make clean
make
make install
