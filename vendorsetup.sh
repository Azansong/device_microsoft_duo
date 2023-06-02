export ARCH=arm64
export PATH=$PATH:${ROOT_DIR}/prebuilts/gcc/linux-x86/arm/arm-linux-androideabi-4.9/bin
export PATH=$PATH:${ROOT_DIR}/prebuilts/gcc/linux-x86/aarch64/aarch64-linux-android-4.9/bin
export PATH=$PATH:${ROOT_DIR}/prebuilts/misc/linux-x86/dtc
export PATH=$PATH:${ROOT_DIR}/prebuilts/misc/linux-x86/libufdt
export PATH=$PATH:${ROOT_DIR}/prebuilts/misc/linux-x86/lz4
export PATH=$PATH:${ROOT_DIR}/prebuilts/misc/linux-x86/libufdt/ufdt_apply_overlay
export TOOL_ARGS+=("HOSTCC=${ROOT_DIR}/prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8/bin/x86_64-linux-gcc")
export TOOL_ARGS+=("HOSTAR=${ROOT_DIR}/prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8/bin/x86_64-linux-ar")
export TOOL_ARGS+=("HOSTLD=${ROOT_DIR}/prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8/bin/x86_64-linux-ld")
export TOOL_ARGS+=("HOSTCFLAGS=-I${ROOT_DIR}/kernel/msm-surface/include/uapi -I/usr/include -I/usr/include/x86_64-linux-gnu -L/usr/lib -L/usr/lib/x86_64-linux-gnu")
export TOOL_ARGS+=("HOSTLDFLAGS=-L/usr/lib -L/usr/lib/x86_64-linux-gnu")
export TOOL_ARGS+=("REAL_CC=${ROOT_DIR}/proprietary/llvm-arm-toolchain-ship/8.0/bin/clang")
export LD_LIBRARY_PATH=${ROOT_DIR}/proprietary/llvm-arm-toolchain-ship/8.0/lib:$LD_LIBRARY_PATH
export CROSS_COMPILE=${ROOT_DIR}/prebuilts/gcc/linux-x86/aarch64/aarch64-linux-android-4.9/bin/aarch64-linux-android-
export CROSS_COMPILE_ARM32=${ROOT_DIR}/prebuilts/gcc/linux-x86/arm/arm-linux-androideabi-4.9/bin/arm-linux-androideabi-
