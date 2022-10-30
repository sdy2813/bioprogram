# manjaro 安装与配置

## wsl

```
#安装Scoop
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser # Optional: Needed to run a remote script the first time
Invoke-WebRequest get.scoop.sh | Invoke-Expression

# 安装ManjaroWSL
scoop bucket add extras
scoop install manjarowsl
```

下载[LxRunOffline](https://ddosolitary-builds.sourceforge.io/LxRunOffline/LxRunOffline-v3.5.0-11-gfdab71a-msvc.zip)
```
./LxRunOffline.exe list
./LxRunOffline.exe get-dir -n Manjaro
icacls D:\Manjaro /grant "sim:(OI)(CI)(F)"
.\LxRunOffline move -n Ubuntu-18.04 -d D:\Manjaro
```

## 换源

启动terminal，输入：
```
sudo pacman-mirrors -i -c China -m rank
sudo pacman-mirrors --fasttrack
```
在弹出的框中选一个最快的源，一个就好，选多了会降低速度

不建议使用archlinuxcn的源，因为并不一定兼容（而且已经有人遇到了问题

如果真的需要用（比如想安装mysql简单点），执行：
```
sudo nano /etc/pacman.conf
```
在末尾输入：
```
[archlinuxcn]
Server = http://mirrors.163.com/archlinux-cn/$arch
```
保存退出（Ctrl+X 输入y）接着更新系统
```
sudo pacman -Syyu
```
系统更新完毕

如果上一步添加了archlinuxcn的源：
```
sudo pacman -S archlinuxcn-keyring
```


## 安装拼音输入法

抛弃fcitx4，拥抱fcitx5吧

安装fcitx5（输入法框架）
```
pacman -S fcitx5 fcitx5-qt fcitx5-gtk fcitx5-configtool
```
配置fcitx5的环境变量：
```
vim ~/.pam_environment
```
内容为：
```
INPUT_METHOD  DEFAULT=fcitx5
GTK_IM_MODULE DEFAULT=fcitx
QT_IM_MODULE  DEFAULT=fcitx
XMODIFIERS    DEFAULT=\@im=fcitx
SDL_IM_MODULE DEFAULT=fcitx
```
或在 ~/.xprofile 写入
```
export GTK_IM_MODULE=fcitx5
export QT_IM_MODULE=fcitx5
export XMODIFIERS="@im=fcitx5"

export LANG="zh_CN.UTF-8"
export LC_CTYPE="zh_CN.UTF-8"
```

安装fcitx5-rime（输入法引擎）
```
yay -S fcitx5-rime
```

安装rime-cloverpinyin（输入方案）
```
yay -S rime-cloverpinyin
```
如果出现问题可能还需要做下面这步：
```
yay -S base-devel
```

切换到该输入方案

在用户资料夹下创建 default.custom.yaml ，内容为
```
patch:
  "menu/page_size": 8
  schema_list:
    - schema: clover
```

## 更改主目录中英文
由于经常在终端要操作家目录，中文切换输入法打字很浪费时间，于是把HOME目录改为英文很方便，在网上看了很多都是修改映射文件，但是会出错而且不生效，找到了下面的方法：
```
$ sudo pacman -S xdg-user-dirs-gtk
$ export LANG=en_US
$ xdg-user-dirs-gtk-update
$ #然后会有个窗口提示语言更改，更新名称即可
$ export LANG=zh_CN.UTF-8
$ #然后重启电脑如果提示语言更改，保留旧的名称即可
```

## 安装AUR
Manjaro背靠Arch软件仓库，安装软件爽的yp，仓库又全又新，基本上遇不到依赖问题需要手动去搜该怎么安装
```
sudo pacman -S yay
```
yay是一个用Go语言写的一个AUR助手，有些时候官方仓库没有你想要的软件，就需要通过yay来安装

有了yay，以后就不用sudo pacman了

除了yay之外还有另外一个现在很流行的aur助手叫做paru（rust编写）
```
sudo pacman -S paru
```
paru相比于yay的优势在于可以用一行命令清除系统上所有不需要的包依赖项，此外在安装来在aur的包的时候会出现对应的PKGBUILD文件让你查看，具体用法可以在其github页面查看：
Morganamilo/paru​
github.com/Morganamilo/paru

```zsh
如果无法安装yay就这么运行
sudo pacman -Sy manjaro-keyring

sudo pacman -S manjaro-system

sudo pacman -Su

sudo pacman-mirrors --fasttrack
```

## 密钥环损坏
```
sudo rm -fr /etc/pacman.d/gnupg #移除旧的keys
sudo pacman-key --init #确保密匙环已正确初始化
sudo pacman-key --populate archlinux manjaro  #从 (给定的) 密匙环中重新加载默认密匙
sudo pacman-key --refresh-keys #从密匙服务器中更新指定的或所有的密匙
sudo pacman -Syyu #安装更新

```


## 常用软件的安装
```
yay -Sy the_silver_searcher

yay -Sy htop

yay -Sy exa

yay -Sy fd

yay -Sy rstudio-desktop-bin

yay -Sy motrix-bin

yay -Sy spyder
 
yay -Sy zotero-bin
 
yay -Sy kdenlive

yay -Sy wemeet-bin 
 
yay -Sy gimp

yay -Sy kompare

yay -Sy diffuse

yay -Sy indicator-sysmonitor

yay -Sy firefox

yay -Sy foxitreader 

yay -Sy deepin-wine-wechat

yay -Sy deepin-wine-qq

yay -Sy typora-free-cn

yay -Sy easystroke

yay -Sy axel

yay -Sy texstudio

yay -Sy sublime-text-4

yay -Sy ttf-sarasa-gothic

yay -Sy openssh

yay -Sy kazam

yay -Rns steam-manjaro

yay -Rns onlyoffice-desktopeditors

yay -S visual-studio-code-bin

yay -S nerd-fonts-complete

yay -S noto-fonts noto-fonts-cjk noto-fonts-emoji noto-fonts-extra

yay -S pamac-aur

yay -S isoimagewriter 

yay -S okular

yay -S dragon

yay -S falkon

yay -S ksysguard 

yay -S ark

yay -S tk

yay -S flameshot

yay -S bluez bluez-utils bluez-firmware pulseaudio-bluetooth pavucontrol pulseaudio-alsa

yay -S dolphin

yay -S ttf-wps-fonts wps-office-mui-zh-cn wps-office-mime-cn wps-office-cn ttf-ms-fonts



```


## 解决NTFS盘不能挂载
```
sudo /sbin/fdisk -l  
sudo ntfsfix /dev/nvme0n1p5 
```

## 安装texlive
```
axel -a https://mirrors.tuna.tsinghua.edu.cn/CTAN/systems/texlive/Images/texlive.iso

sudo mount -o loop texlive.iso /mnt

cd /mnt

sudo ./install-tl --gui # (依赖图形库tk,没有的话需要pacman -S tk)

```

## sublime text 4 license
```
—– BEGIN LICENSE —–
Mifeng User
Single User License
EA7E-1184812
C0DAA9CD 6BE825B5 FF935692 1750523A
EDF59D3F A3BD6C96 F8D33866 3F1CCCEA
1C25BE4D 25B1C4CC 5110C20E 5246CC42
D232C83B C99CCC42 0E32890C B6CBF018
B1D4C178 2F9DDB16 ABAA74E5 95304BEF
9D0CCFA9 8AF8F8E2 1E0A955E 4771A576
50737C65 325B6C32 817DCB83 A7394DFA
27B7E747 736A1198 B3865734 0B434AA5
—— END LICENSE ——
```

## 双系统grub配置

查看Windows引导分区的UUID
```
sudo fdisk -l    ##获取所有硬盘信息
```
获取且将引导分区的UUID复制下来 
```
sudo blkid /dev/nvme1n1p1
```
对 /boot/grub/grub.cfg 进行修改
```
sudo vim /boot/grub/grub.cfg ## 找到 /etc/grub.d/30_os-prober

### BEGIN /etc/grub.d/30_os-prober ###
### END /etc/grub.d/30_os-prober ###

# 将以下内容添加到其中

menuentry 'Microsoft Windows 11' {    ##''内的名称可以自定义
        insmod part_gpt
        insmod fat
        insmod chain
        search --fs-uuid --no-floppy --set=root XXXX-XXXX    ## XXXX-XXXX就是刚才复制的UUID
        chainloader (${root})/EFI/Microsoft/Boot/bootmgfw.efi
}
```
保存并退出


---
参考教程：
1. [Manjaro的初始配置](https://zhuanlan.zhihu.com/p/343125473)
2. [Manjaro-KDE安装配置全攻略](https://zhuanlan.zhihu.com/p/114296129)
3. [WSL2 中使用 systemctl 命令](https://www.isolves.com/it/qt/2020-12-10/34360.html)
4. [WSL2 的 Linux 中运行 systemctl 命令](https://zhuanlan.zhihu.com/p/335162006)
5. [Manjaro上的必装软件有这些！](https://zhuanlan.zhihu.com/p/346510961)
6. [sublime test crack](https://gist.github.com/JerryLokjianming/71dac05f27f8c96ad1c8941b88030451)
7. [Manjaro KDE 调教配置及美化](https://zhuanlan.zhihu.com/p/460826583)
8. [安装Manjaro之后首先要做的是...](https://zhuanlan.zhihu.com/p/90634218)
9. [折腾不死，就往死里折腾~记Win10系统更新后导致Linux](https://blog.51cto.com/u_15127575/2901889)
10. [windows更新导致进不去linux](https://blog.csdn.net/weixin_44046493/article/details/123039676)
11. [Windows10+Manjaro Linux深度指北](https://breezeshane.github.io/Linux/Manjaro%E5%AE%89%E8%A3%85%E4%B8%8E%E9%85%8D%E7%BD%AE/#_1-windows10-manjaro-linux%E6%B7%B1%E5%BA%A6%E6%8C%87%E5%8C%97)
12. [manjaro技術筆記](http://www.5190m.top/note/2022/5/20/2022-05-20-manjaro.html#gpg-key)
13. [Manjaro下texlive环境配置指北](https://www.blurredcode.com/2020/08/linux%E4%B8%8Btexlive%E7%8E%AF%E5%A2%83%E9%85%8D%E7%BD%AE%E6%8C%87%E5%8C%97/)
14. [在 Manjaro 下安装 TeX Live](https://skiyer.github.io/post/manjaro-texlive/)
15. [在 Manjaro 上安装 LaTeX](https://zhouxianghui.xyz/posts/linux/install-latex/)
16. [安装manjaro遇到的pgb签名问题终极解决方案](https://www.ippa.top/750.html)
17. [使用grub实现Linux和Windows双系统的引导](https://blog.csdn.net/weixin_43801670/article/details/125106208)



