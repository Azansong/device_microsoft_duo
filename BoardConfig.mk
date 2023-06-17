#
# Copyright (C) 2021 The TWRP Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

DEVICE_PATH := device/microsoft/duo

# For building with minimal manifest
ALLOW_MISSING_DEPENDENCIES := true
BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := generic

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a9

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := $(PRODUCT_PLATFORM)
TARGET_NO_BOOTLOADER := true
TARGET_USES_UEFI := true

# Assert
TARGET_OTA_ASSERT_DEVICE := duo

#Display
TARGET_SCREEN_DENSITY := 401

# A/B
AB_OTA_UPDATER := true

AB_OTA_PARTITIONS := \
    boot \
    dtbo \
    odm \
    product \
    system \
    system_ext \
    vbmeta \
    vbmeta_system \
    vendor

# Kernel
TARGET_NO_KERNEL := false
TARGET_KERNEL_ARCH := $(TARGET_ARCH)
TARGET_KERNEL_HEADER_ARCH := $(TARGET_ARCH)
TARGET_CROSS_COMPILE=aarch64-linux-android-
TARGET_CROSS_COMPILE_ARM32=arm-linux-androideabi-
TARGET_CLANG_TRIPLE=aarch64-linux-gnu-
TARGET_KERNEL_CONFIG := vendor/surfaceduo-perf_defconfig
TARGET_KERNEL_SOURCE := kernel/msm-4.14

BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_IMAGE_NAME := Image
BOARD_KERNEL_PAGESIZE := 4096

BOARD_KERNEL_SEPARATED_DTBO := true
BOARD_INCLUDE_DTB_IN_BOOTIMG := true

BOARD_BOOT_HEADER_VERSION := 2
BOARD_MKBOOTIMG_ARGS += --dtb $(TARGET_PREBUILT_DTB)
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOT_HEADER_VERSION)

BOARD_KERNEL_CMDLINE += androidboot.console=ttyMSM0
BOARD_KERNEL_CMDLINE += androidboot.hardware=qcom
BOARD_KERNEL_CMDLINE += androidboot.memcg=1
BOARD_KERNEL_CMDLINE += androidboot.selinux=permissive
BOARD_KERNEL_CMDLINE += androidboot.usbcontroller=a600000.dwc3
BOARD_KERNEL_CMDLINE += cgroup.memory=nokmem,nosocket
BOARD_KERNEL_CMDLINE += console=ttyMSM0,115200n8
BOARD_KERNEL_CMDLINE += earlycon=msm_geni_serial,0x880000
BOARD_KERNEL_CMDLINE += ip6table_raw.raw_before_defrag=1
BOARD_KERNEL_CMDLINE += iptable_raw.raw_before_defrag=1
BOARD_KERNEL_CMDLINE += lpm_levels.sleep_disabled=1
BOARD_KERNEL_CMDLINE += msm_rtb.filter=0x237
BOARD_KERNEL_CMDLINE += pcie_ports=compat
BOARD_KERNEL_CMDLINE += service_locator.enable=1
BOARD_KERNEL_CMDLINE += swiotlb=0
BOARD_KERNEL_CMDLINE += video=vfb:640x400,bpp=32,memsize=3072000

# Use Snapdragon LLVM clang compiler
TARGET_KERNEL_USE_CUSTOM_TOOLCHAIN := true
TARGET_KERNEL_CUSTOM_TOOLCHAIN := ${ROOT_DIR}/proprietary/llvm-arm-toolchain-ship/8.0/bin/clang
TARGET_LD_SHIM_LIBS += $(call host-path,${ROOT_DIR}/proprietary/llvm-arm-toolchain-ship/8.0/lib)

#TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/Kernel
#TARGET_PREBUILT_DTB := $(DEVICE_PATH)/prebuilt/dtb.img
#BOARD_PREBUILT_DTBOIMAGE := $(DEVICE_PATH)/prebuilt/dtbo.img

# Metadata
BOARD_USES_METADATA_PARTITION := true
BOARD_USES_QCOM_FBE_DECRYPTION := true

# Partitions
BOARD_FLASH_BLOCK_SIZE := 262144
BOARD_BOOTIMAGE_PARTITION_SIZE := 100663296

BOARD_SUPER_PARTITION_GROUPS := qti_dynamic_partitions
BOARD_SUPER_PARTITION_SIZE := 14680064000
BOARD_QTI_DYNAMIC_PARTITIONS_PARTITION_LIST := odm product system system_ext vendor
BOARD_QTI_DYNAMIC_PARTITIONS_SIZE := 14675869696 # (BOARD_SUPER_PARTITION_SIZE - 4MB)

BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_COPY_OUT_VENDOR := vendor

# Platform
BOARD_USES_QCOM_HARDWARE := true
TARGET_BOARD_PLATFORM := msmnile

# Properties
BOARD_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop

# Recovery
BOARD_USES_RECOVERY_AS_BOOT := true
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/recovery.fstab
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

#TWRP Decryption
PLATFORM_SECURITY_PATCH := 2099-12-31
VENDOR_SECURITY_PATCH := $(PLATFORM_SECURITY_PATCH)
PLATFORM_VERSION := 16.1.0
TW_INCLUDE_CRYPTO := true

# TWRP Debug Flags
TARGET_USES_LOGD := true
TWRP_INCLUDE_LOGCAT := true
BOARD_RAMDISK_USE_LZMA := true
TARGET_RECOVERY_DEVICE_MODULES += debuggerd
TW_RECOVERY_ADDITIONAL_RELINK_FILES += $(TARGET_OUT_EXECUTABLES)/debuggerd

#TWRP Specific build flags
TW_THEME := portrait_hdpi
TW_EXTRA_LANGUAGES := true
TW_OVERRIDE_SYSTEM_PROPS := \
    "ro.build.date.utc;ro.build.product;ro.build.fingerprint=ro.system.build.fingerprint;ro.build.version.incremental;ro.product.device=ro.product.system.device;ro.product.model=ro.product.system.model;ro.product.name=ro.product.system.name"
TW_USE_FSCRYPT_POLICY := 1
TW_SCREEN_BLANK_ON_BOOT := true
TW_EXCLUDE_DEFAULT_USB_INIT := true
TW_INPUT_BLACKLIST := "hbtp_vm"
TW_INCLUDE_NTFS_3G := true
TW_INCLUDE_REPACKTOOLS := true
TW_INCLUDE_RESETPROP := true

# Verified Boot
BOARD_AVB_ENABLE := true
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flags 3
BOARD_AVB_VBMETA_SYSTEM := system system_ext product
BOARD_AVB_VBMETA_SYSTEM_KEY_PATH := external/avb/test/data/testkey_rsa2048.pem
BOARD_AVB_VBMETA_SYSTEM_ALGORITHM := SHA256_RSA2048
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX_LOCATION := 1
