setenv bootargs "console=ttyS0,115200n8 root=/dev/mmcblk1p2 rootwait rw quiet loglevel=4"

# Load kernel, DTB, and initrd from MicroSD partition 1
fatload mmc 1:1 ${kernel_addr_r} Image
fatload mmc 1:1 ${fdt_addr_r} ums512-anbernic-rg405m.dtb
fatload mmc 1:1 ${ramdisk_addr_r} initrd.squashfs

# Boot arm64 Linux kernel
booti ${kernel_addr_r} ${ramdisk_addr_r} ${fdt_addr_r}
