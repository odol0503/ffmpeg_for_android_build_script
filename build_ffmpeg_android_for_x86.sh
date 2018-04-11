#!/bin/bash
NDK=/home/shoh/android-ndk-r10e
SYSROOT=$NDK/platforms/android-21/arch-x86/
TOOLCHAIN=$NDK/toolchains/x86-4.9/prebuilt/linux-x86_64
function build_one
{
	./configure \
		--prefix=$PREFIX \
		--extra-cflags="-Os -fpic -I./libx264/include" \
		--extra-ldflags=-L./libx264/lib \
		--disable-asm \
		--enable-gpl \
		--enable-libx264 \
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
		--arch=x86 \
		--cross-prefix=$TOOLCHAIN/bin/i686-linux-android- \
		--target-os=linux \
		--enable-cross-compile \
		--sysroot=$SYSROOT \
		$ADDITIONAL_CONFIGURE_FLAG
	make clean
	make
	make install
}
CPU=x86
PREFIX=$(pwd)/android/$CPU
build_one
