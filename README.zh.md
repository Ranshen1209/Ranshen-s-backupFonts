## Marble 备份字库

该脚本专为 Marble 备份字库。备份除了cust和super分区的所有分区。

### README 翻译版本

---

- [English](README.md)
- [中文](README.zh.md)

### 使用说明

---

#### 准备

1. 需要一台 Windows10 以上的电脑
2. 稳定且能传输数据的 TypeC 数据线
3. 已经开启USB调试、获取ROOT权限并授予 Shell ROOT权限的 Marble

#### 步骤

1. 将 Marble 通过 TypeC 数据线连接至电脑
2. 确保USB调试和ROOT已经准备就绪
3. 双击 extract_images.bat 开始提取分区至手机的/sdcard/deviceImages和电脑的C:\deviceImages

#### 恢复

1. 将 flash_images.bat 和platform-tools文件夹复制到C:\deviceImages或你改变储存分区的位置
2. 运行flash_images.bat

#### 注意

1. 考虑到备份的大小和时间，脚本未提取super和cust分区，所以必要时需要再次刷入官方的线刷包。

### 如何为其它机型做适配

---

1. adb shell连接需要做适配的机型
2. 获取su权限
3. ls /dev/block/bootdevice/by-name/
4. 根据输出的内容修改extract_images.bat里的 partitions