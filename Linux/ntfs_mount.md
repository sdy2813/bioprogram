# 解决 linux下 NTFS 分区 无法挂载的问题

1. 手动挂载 NTFS 分区
使用 ntfs-3g 工具手动挂载 NTFS 分区：

```
sudo ntfs-3g /dev/nvme0n1p3 /run/media/sdy/7E7D8E3775164CA1
```

2. 检查并修复 NTFS 文件系统
可以使用 ntfsfix 工具来检查和修复 NTFS 文件系统。注意，ntfsfix 只能修复一些常见的问题，对于更复杂的问题可能需要使用 Windows 下的工具进行修复。

```
sudo ntfsfix /dev/nvme0n1p3
```

3. 检查挂载点权限
确保挂载点 /run/media/sdy/7E7D8E3775164CA1 存在并且具有正确的权限：

```
sudo mkdir -p /run/media/sdy/7E7D8E3775164CA1
sudo chown $USER:$USER /run/media/sdy/7E7D8E3775164CA1
```

若不存在，按上述命名创建，其后再次挂载

```
sudo ntfs-3g /dev/nvme0n1p3 /run/media/sdy/7E7D8E3775164CA1
```

