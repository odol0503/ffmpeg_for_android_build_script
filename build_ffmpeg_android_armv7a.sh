#!/bin/bash
NDK=/home/shoh/android-ndk-r13b
SYSROOT=$NDK/platforms/android-21/arch-arm/
TOOLCHAIN=$NDK/toolchains/arm-linux-androideabi-4.9/prebuilt/linux-x86_64
CPU=armv7a
PREFIX=$(pwd)/android/$CPU

function build_one
{
	./configure \
		--prefix=$PREFIX \
		--extra-cflags='-Os -fpic -marm -march=armv7-a -mfloat-abi=softfp -mfpu=neon -I./libx264/include' \
		--extra-ldflags='-Wl,--fix-cortex-a8 -L./libx264/lib' \
		--enable-gpl \
		--enable-muxer=mp1,mp2,mp3\
		--enable-decoder=mp1,mp2,mp3 \
		--disable-libx264 \
		--disable-postproc \
		--enable-shared \
		--disable-static \
		--disable-doc \
		--disable-ffmpeg \
		--disable-ffplay \
		--disable-ffprobe \
		--disable-ffserver \
		--disable-avdevice \
		--disable-doc \
		--disable-symver \
		--arch=armv8-a \
		--cross-prefix=$TOOLCHAIN/bin/arm-linux-androideabi- \
		--target-os=linux \
		--enable-cross-compile \
		--sysroot=$SYSROOT \
		$ADDITIONAL_CONFIGURE_FLAG
	make clean
	make
	make install
}

build_one