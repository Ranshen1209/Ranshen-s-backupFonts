setlocal enabledelayedexpansion
set PATH=%~dp0platform-tools;%PATH%

set output_dir=C:\deviceImages
set device_images_dir=/sdcard/deviceImages

set partitions=abl_a abl_b ALIGN_TO_128K_1 ALIGN_TO_128K_2 aop_a aop_b aop_config_a aop_config_b apdp apdp2 bk01 bk010 bk02 bk03 bk04 bk05 bk06 bk07 bk31 bk32 bk41_a bk41_b bk42 bk43 bk51 bluetooth_a bluetooth_b boot_a boot_b cdt connsec countrycode cpucp_a cpucp_b crash_history dbg ddr devcfg_a devcfg_b devinfo dip dsp_a dsp_b dtbo_a dtbo_b fastboot featenabler_a featenabler_b ffu frp fsc fsg gsort hyp_a hyp_b imagefv_a imagefv_b keymaster_a keymaster_b keystore limits-cdsp limits logfs mbnconfig mdcompress mdtpsecapp_a mdtpsecapp_b mdtp_a mdtp_b mem metadata minidump misc modemst1 modemst2 modem_a modem_b mtdblk multiimgoem_a multiimgoem_b multiimgqti_a multiimgqti_b oops opconfig persist qmcs qupfw_a qupfw_b qweslicstore_a qweslicstore_b rawdump recovery_a recovery_b rescue rtice secdata shrm_a shrm_b splash ssd storsec switch toolsfv tzsc tz_a tz_b uefisecapp_a uefisecapp_b uefivarstore uefi_a uefi_b vbmeta_a vbmeta_b vbmeta_system_a vbmeta_system_b vendor_boot_a vendor_boot_b vm-data xbl_a xbl_b xbl_config_a xbl_config_b xbl_ramdump_a xbl_ramdump_b xbl_sc_logs xbl_sc_test_mode

if not exist "%output_dir%" (
    mkdir "%output_dir%"
)

adb shell mkdir -p %device_images_dir%

for %%p in (%partitions%) do (
    set partition_name=%%p

    echo Extracting image of partition %%p...
    adb shell su -c "dd if=/dev/block/bootdevice/by-name/%%p of=%device_images_dir%/!partition_name!.img"
    adb pull %device_images_dir%/!partition_name!.img %output_dir%\!partition_name!.img
    echo Image of partition %%p has been saved to %output_dir%\!partition_name!.img
)

echo All partition images, except cust and super partitions, have been successfully extracted.
pause