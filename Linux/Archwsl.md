# Archwsl 安装与配置

## 启动wsl
```
# 用管理员打开powershell输入
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
```

## 启用虚拟平台
```
# 用管理员打开powershell输入
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
```

## 下载Linux内核升级包
```
https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi
```

## 将WSL2设置为默认版本
```
# 用管理员打开powershell输入
wsl --set-default-version 2
```

## 下载LxRunOffline
```
https://ddosolitary-builds.sourceforge.io/LxRunOffline/LxRunOffline-v3.5.0-11-gfdab71a-msvc.zip
```

## 下载Archlinux
```
https://mirrors.tuna.tsinghua.edu.cn/archlinux/iso/latest/archlinux-bootstrap-x86_64.tar.gz
# LxRunOffline i -n <自定义名称> -f <Arch镜像位置> -d <安装系统的位置> -r root.x86_64
LxRunOffline i -n archlinux -f D:\WSL\archlinux_img\archlinux-bootstrap-2021.10.01-x86_64.tar.gz  -d  D:\WSL\archlinux -r root.x86_64
```

## 进入系统
```
wsl -d <名字>
wsl -d archlinux
```

## 另一套
```bash
# 安装scoop
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser # Optional: Needed to run a remote script the first time
irm get.scoop.sh | iex

# 安装archlinux
scoop bucket add extras https://mirror.ghproxy.com/https://github.com/ScoopInstaller/Extras.git
scoop install archwsl

# 下载LxRunOffline
https://ddosolitary-builds.sourceforge.io/LxRunOffline/LxRunOffline-v3.5.0-11-gfdab71a-msvc.zip
./LxRunOffline.exe list
./LxRunOffline.exe get-dir -n Manjaro
icacls D:\Manjaro /grant "sim:(OI)(CI)(F)"
.\LxRunOffline move -n Ubuntu-18.04 -d D:\Manjaro

# 国内源
sudo cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.backup
sudo vim /etc/pacman.d/mirrorlist
Server = https://mirrors.tuna.tsinghua.edu.cn/archlinux/$repo/os/$arch

# 国内社区源
sudo cp /etc/pacman.conf /etc/pacman.conf.backup
sudo vim /etc/pacman.conf
[archlinuxcn]
Server = https://mirrors.tuna.tsinghua.edu.cn/archlinuxcn/$arch

# 安装密钥环
sudo pacman -S archlinuxcn-keyring
# 更新系统
sudo pacman -Syyu

# 配置shell
yay -S zsh
wget -c https://fastly.jsdelivr.net/gh/sdy2813/bioprogram@main/Linux/zsh_install.sh
# 插件
# zsh-syntax-highlighting(命令语法高亮)
git clone https://gitclone.com/github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
# zsh-autosuggestions(命令自动补全)
git clone https://gitclone.com/github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
# 手动修改~/.zshrc
plugins=(git zsh-autosuggestions zsh-syntax-highlighting z extract)
# 添加颜色
echo "export TERM=xterm-256color" >> ~/.zshrc

# 安装常用软件
yay -S htop
yay -S exa
yay -S duf
yay -S axel 
yay -S the_silver_searcher
yay -S fd
```

## 网页视频无法播放

```bash
# 重启 pulseaudio ，此时访问视频无声音、流畅播放
#pulseaudio --kill && pulseaudio --start

# 换用 pipwire-pulse 重启后访问视频有声音、流畅播放
sudo pacman -S pipewire pipewire-pulse

# 停止并禁用 PulseAudio

systemctl --user disable --now pulseaudio.socket
systemctl --user disable --now pulseaudio.service

# 启动并启用 Pipewire
systemctl --user enable --now pipewire.socket
systemctl --user enable --now pipewire-pulse.socket
systemctl --user enable --now pipewire-pulse.service
systemctl --user enable --now pipewire-media-session.service

```

----
参考资料：
1. [wsl安装archlinux(Windows10子系统安装archlinux)](https://zhuanlan.zhihu.com/p/417410431)
2. [使用grub实现Linux和Windows双系统的引导](https://blog.csdn.net/weixin_43801670/article/details/125106208)
3. [Linux 连接蓝牙耳机无法正确识别的解决方案（仅供参考）](https://www.bilibili.com/read/cv16702824?from=search)
4. [Arch安装网络打印机驱动](https://www.qingsword.com/qing/Arch-6.html)
