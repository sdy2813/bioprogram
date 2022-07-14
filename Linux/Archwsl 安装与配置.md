# Archwsl 安装与配置

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

