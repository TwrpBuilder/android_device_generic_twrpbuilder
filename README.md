# TWRP-build-files-for-MT8163-arm-deviceBoot image tools for Samsung Galaxy Tab 4 7.0, Degas board Marvell PXA1088

Unpack boot.img:

$ mkdir boot

$ tools/degas-unpackbootimg -i boot.img -o boot

$ mkdir -p boot/ramdisk

$ cd boot/ramdisk/

$ gunzip -c ../boot.img-ramdisk.gz | cpio -i

$ cd ../

Repack boot.img:

$ ../tools/mkbootfs ramdisk | ../tools/minigzip > boot.img-ramdisk-new.gz

$ ../tools/degas-mkbootimg --kernel boot.img-zImage \

--ramdisk boot.img-ramdisk-new.gz --dt boot.img-dt \

--signature boot.img-signature -o ../boot-new.img

$ cd ../

I'm not sure about boot image signature, you can try without --signature

option. By comparing boot image to recovery image, I found a different

signature and of course a different ramdisk but the rest is the same, including

kernel and device tree table.

To confirm this tools reliability, you can unpack and then repack original

boot/recovery image without modification. You will got two identical image,

check it using a diff tool.

Generate kernel spesific device tree table:

$ tools/degas-dtbTool -o boot.img-dt-new -p kernel/scripts/dtc/ kernel/arch/arm/boot/dts/

Repack a new recovery as a flashable Odin:

$ tar -H ustar -c recovery-testkey.img > recovery-testkey.img.tar

$ md5sum -t recovery-testkey.img.tar >> recovery-testkey.img.tar

$ mv recovery-testkey.img.tar recovery-testkey.img.tar.md5

DISCLAIMER:

USE THIS TOOLS AT YOUR OWN RISK, I DON'T OWN TAB 4 7.0 FOR TESTING

Ketut P. Kumajaya, June 2014
