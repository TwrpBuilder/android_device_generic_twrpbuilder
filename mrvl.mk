ifneq ($(filter mrvl,$(TARGET_BOARD_PLATFORM)),)
MRVL_ION := true
BOARD_CUSTOM_BOOTIMG := true
BOARD_MRVL_BOOTIMG := true
BOARD_CUSTOM_MKBOOTIMG := marvl-mkbootimg
BOARD_CUSTOM_BOOTIMG_MK := device/generic/twrpbuilder/mrvl/bootimg.mk
endif
