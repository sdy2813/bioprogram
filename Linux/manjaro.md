# manjaro
1. wsl

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


2. 换源

启动terminal，输入：
```
sudo pacman-mirrors -i -c China -m rank
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
3. 安装软件

Manjaro背靠Arch软件仓库，安装软件爽的yp，仓库又全又新，基本上遇不到依赖问题需要手动去搜该怎么安装，这也是我不愿意换回Ubuntu的一个重要原因
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

5.1 安装拼音输入法：

抛弃fcitx4，拥抱fcitx5吧，btw搜狗、百度、google输入法都是垃圾

安装fcitx5（输入法框架）
```
yay -S fcitx5-im
```
配置fcitx5的环境变量：
```
vim ~/.pam_environment
```
内容为：
```
GTK_IM_MODULE DEFAULT=fcitx
QT_IM_MODULE  DEFAULT=fcitx
XMODIFIERS    DEFAULT=\@im=fcitx
SDL_IM_MODULE DEFAULT=fcitx
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


由于经常在终端要操作家目录，中文切换输入法打字很浪费时间，于是把HOME目录改为英文很方便，在网上看了很多都是修改映射文件，但是会出错而且不生效，找到了下面的方法：
```
$ sudo pacman -S xdg-user-dirs-gtk
$ export LANG=en_US
$ xdg-user-dirs-gtk-update
$ #然后会有个窗口提示语言更改，更新名称即可
$ export LANG=zh_CN.UTF-8
$ #然后重启电脑如果提示语言更改，保留旧的名称即可
```

```zsh
如果无法安装yay就这么运行
sudo pacman -Sy manjaro-keyring

sudo pacman -S manjaro-system

sudo pacman -Su

sudo pacman-mirrors --fasttrack
```

```
scoop install manjarowsl

scoop uninstall manjarowsl

scoop update manjarowsl

```

常用软件的安装
```
yay -S the_silver_searcher

yay -S htop

yay -S exa

yay -S fd


```
---
参考教程：
1. [Manjaro的初始配置](https://zhuanlan.zhihu.com/p/343125473)
2. [Manjaro-KDE安装配置全攻略](https://zhuanlan.zhihu.com/p/114296129)
3. [WSL2 中使用 systemctl 命令](https://www.isolves.com/it/qt/2020-12-10/34360.html)



