function build_one
{
	./configure \
		--prefix=$PREFIX \
		--extra-cflags="-Os -fpic -I./libx264/include" \
		--extra-ldflags=-L./libx264/lib \
		--enable-gpl \
		--enable-muxer=mp1,mp2,mp3 \
		--enable-decoder=mp1,mp2,mp3 \
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
		--arch=aarch64 \
		--cross-prefix=$TOOLCHAIN/bin/aarch64-linux-android- \
		--target-os=linux \
		--enable-cross-compile \
		--sysroot=$SYSROOT \
		$ADDITIONAL_CONFIGURE_FLAG
	make clean
	make
	make install
}

build_one
