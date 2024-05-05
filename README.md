# Ranshen-s-backupFonts

## Marble Backup Script

This script is specifically designed for Marble to back up all partitions except for the *cust* and *super* partitions.

### Translated README Versions

---

- [English](README.md)
- [Chinese](README.zh.md)

### Usage Instructions

---

#### Preparation

1. A Windows 10 or later computer
2. A stable Type-C data cable capable of data transfer
3. A Marble device with USB debugging enabled, rooted, and granted shell root permissions

#### Steps

1. Connect the Marble device to the computer using a Type-C data cable.
2. Ensure USB debugging and root permissions are properly set up.
3. Double-click *extract_images.bat* to begin extracting partitions to `/sdcard/deviceImages` on the device and `C:\deviceImages` on the computer.

#### Restoration

1. Copy *flash_images.bat* and the *platform-tools* folder to `C:\deviceImages` or the modified storage location.
2. Run *flash_images.bat*.

#### Notes

1. Considering the size and time required for backup, the script does not extract the *super* and *cust* partitions, so re-flashing the official firmware package may be necessary if required.