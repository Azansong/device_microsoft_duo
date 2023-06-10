export LD_LIBRARY_PATH=${ROOT_DIR}/proprietary/llvm-arm-toolchain-ship/8.0/lib:$LD_LIBRARY_PATH
export PATH=$PATH:${ROOT_DIR}/prebuilts/gcc/linux-x86/arm/arm-linux-androideabi-4.9/bin
export PATH=$PATH:${ROOT_DIR}/prebuilts/gcc/linux-x86/aarch64/aarch64-linux-android-4.9/bin
export PATH=$PATH:${ROOT_DIR}/prebuilts/misc/linux-x86/dtc
export DTC_EXT=${ROOT_DIR}/prebuilt/misc/linux-x86/dtc/dtc
export PATH=$PATH:${ROOT_DIR}/prebuilts/misc/linux-x86/libufdt
export PATH=$PATH:${ROOT_DIR}/prebuilts/misc/linux-x86/lz4
export PATH=$PATH:${ROOT_DIR}/prebuilts/misc/linux-x86/libufdt/ufdt_apply_overlay
