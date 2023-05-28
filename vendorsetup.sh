LD_LIBRARY_PATH=${ROOT_DIR}/proprietary/llvm-arm-toolchain-ship/8.0/lib:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH

TOOL_ARGS=()
TOOL_ARGS+=("HOSTCC=${ROOT_DIR}/prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8/bin/x86_64-linux-gcc")
TOOL_ARGS+=("HOSTAR=${ROOT_DIR}/prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8/bin/x86_64-linux-ar")
TOOL_ARGS+=("HOSTLD=${ROOT_DIR}/prebuilts/gcc/linux-x86/host/x86_64-linux-glibc2.17-4.8/bin/x86_64-linux-ld")
TOOL_ARGS+=("HOSTCFLAGS=-I${ROOT_DIR}/kernel/msm-surface/include/uapi -I/usr/include -I/usr/include/x86_64-linux-gnu -L/usr/lib -L/usr/lib/x86_64-linux-gnu")
TOOL_ARGS+=("HOSTLDFLAGS=-L/usr/lib -L/usr/lib/x86_64-linux-gnu")
TOOL_ARGS+=("REAL_CC=${ROOT_DIR}/proprietary/llvm-arm-toolchain-ship/8.0/bin/clang")

CLANG_TRIPLE=aarch64-linux-gnu-
LINUX_GCC_CROSS_COMPILE_PREBUILTS_BIN=prebuilts/gcc/linux-x86/aarch64/aarch64-linux-android-4.9/bin
LINUX_GCC_CROSS_COMPILE_ARM32_PREBUILTS_BIN=prebuilts/gcc/linux-x86/arm/arm-linux-androideabi-4.9/bin
LZ4_PREBUILTS_BIN=prebuilts/misc/linux-x86/lz4
DTC_PREBUILTS_BIN=prebuilts/misc/linux-x86/dtc
LIBUFDT_PREBUILTS_BIN=prebuilts/misc/linux-x86/libufdt
DTC_EXT=${ROOT_DIR}/prebuilts/misc/linux-x86/dtc/dtc
export DTC_EXT
DTC_OVERLAY_TEST_EXT=${ROOT_DIR}/prebuilts/misc/linux-x86/libufdt/ufdt_apply_overlay
export DTC_OVERLAY_TEST_EXT

FILES="
arch/arm64/boot/Image*
arch/arm64/boot/dtbo.img
arch/arm64/boot/dts/qcom/sm8150-v2.dtb
arch/arm64/boot/dts/qcom/sm8150.dtb
vmlinux
arch/arm64/boot/dtbo.img
arch/arm64/boot/dts/surface/*.dtbo
System.map
.config
"
EXT_MODULES="
kernel/msm-modules/wlan/qcacld-3.0
"
IN_KERNEL_MODULES=1
STOP_SHIP_TRACEPRINTK=1
