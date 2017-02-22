# ffmpeg_for_android_build_script
ffmpeg-3.2.4 build script for android

# Build environment
Unbuntu + NDKr13b

# How to build it
1. add ffmpeg sources
2. add libx264 library (option)
3. modify configure file like following define
“`
var i = 0;
“`
  [before]
  SLIBNAME_WITH_MAJOR='$(SLIBNAME).$(LIBMAJOR)'
  LIB_INSTALL_EXTRA_CMD='$$(RANLIB) "$(LIBDIR)/$(LIBNAME)"'
  SLIB_INSTALL_NAME='$(SLIBNAME_WITH_VERSION)'
  SLIB_INSTALL_LINKS='$(SLIBNAME_WITH_MAJOR) $(SLIBNAME)'
  [after]
  SLIBNAME_WITH_MAJOR='$(SLIBPREF)$(FULLNAME)-$(LIBMAJOR)$(SLIBSUF)'
  LIB_INSTALL_EXTRA_CMD='$$(RANLIB) "$(LIBDIR)/$(LIBNAME)"'
  SLIB_INSTALL_NAME='$(SLIBNAME_WITH_MAJOR)'
  SLIB_INSTALL_LINKS='$(SLIBNAME)'
4. chmod +x build_ffmpeg_android.sh
5. run build_ffmpeg_android.sh
6. check ffmpeg-3.2.4/android/arm
“`
var i = 0;
“`
