### AnyKernel3 Ramdisk Mod Script
## osm0sis @ xda-developers

### AnyKernel setup
# global properties
properties() { '
kernel.string=NetHunter kernel for Nothing Phone 1
do.devicecheck=0
do.modules=1
do.systemless=1
do.cleanup=1
do.cleanuponabort=0
device.name1=
device.name2=
device.name3=
device.name4=
device.name5=
supported.versions=11.0-16.0
supported.patchlevels=
supported.vendorpatchlevels=
'; } # end properties

# shell variables
#block=boot
#is_slot_device=1
#ramdisk_compression=auto
#patch_vbmeta_flag=auto

# boot shell variables
block=boot
is_slot_device=1
ramdisk_compression=auto
patch_vbmeta_flag=auto
#no_magisk_check=1

# import functions/variables and setup patching - see for reference (DO NOT REMOVE)
. tools/ak3-core.sh


## AnyKernel file attributes
# set permissions/ownership for included ramdisk files
set_perm_recursive 0 0 755 644 $ramdisk/*;
set_perm_recursive 0 0 750 750 $ramdisk/init* $ramdisk/sbin;

# boot install
#if [ -L "/dev/block/bootdevice/by-name/init_boot_a" -o -L "/dev/block/by-name/init_boot_a" ]; then
#    split_boot # for devices with init_boot ramdisk
#    flash_boot # for devices with init_boot ramdisk
#else
#    dump_boot # use split_boot to skip ramdisk unpack, e.g. for devices with init_boot ramdisk
#    write_boot # use flash_boot to skip ramdisk repack, e.g. for devices with init_boot ramdisk
#fi
## end boot install


# shell variables
block=vendor_boot
is_slot_device=1
ramdisk_compression=auto
patch_vbmeta_flag=auto

# reset for vendor_boot patching
reset_ak

## AnyKernel vendor_boot install
split_boot # skip unpack/repack ramdisk since we don't need vendor_ramdisk access

flash_boot
## end vendor_boot install
