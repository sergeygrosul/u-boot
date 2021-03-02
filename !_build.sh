make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- Adatis_800x480LCD_defconfig
#make CROSS_COMPILE=arm-linux-gnueabihf- menuconfig
make -j8 CROSS_COMPILE=arm-linux-gnueabihf-