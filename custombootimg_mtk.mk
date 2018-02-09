$(INSTALLED_RECOVERYIMAGE_TARGET): $(MKBOOTIMG) \
		$(recovery_ramdisk)
	@echo ----- Making recovery image ------
	perl device/generic/twrpbuilder/repack-MT65xx.pl -recovery $(TARGET_PREBUILT_KERNEL) out/target/product/$(TARGET_DEVICE)/recovery/root $@ $(MKBOOTIMG)
	@echo ----- Made recovery image -------- $@
	$(hide) $(call assert-max-image-size,$@,$(BOARD_RECOVERYIMAGE_PARTITION_SIZE),raw)


$(INSTALLED_BOOTIMAGE_TARGET): $(MKBOOTIMG) $(INTERNAL_BOOTIMAGE_FILES)
	$(call pretty,"Target boot image: $@")
	perl device/generic/twrpbuilder/repack-MT65xx.pl -boot $(TARGET_PREBUILT_KERNEL) out/target/product/$(TARGET_DEVICE)/root $@ $(MKBOOTIMG)
	$(hide) $(call assert-max-image-size,$@,$(BOARD_BOOTIMAGE_PARTITION_SIZE),raw)
