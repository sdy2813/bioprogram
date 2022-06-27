#!/bin/bash
# 最好先安装zsh并修改插件选项
# 如果家目录没有app文件夹
cd ~ && mkdir app
cd ~/app

# 安装htop
wget https://gh.ddlc.top/https://github.com/htop-dev/htop/releases/download/3.2.1/htop-3.2.1.tar.xz | tar xvz -C .
mkdir htop
cd htop-3.2.1
./configure --prefix=$HOME/app/htop --disable-unicode
make && make install
cd ~/app
rm -rf htop-2.2.0


# 安装axel
wget -c https://gh.ddlc.top/https://github.com/axel-download-accelerator/axel/releases/download/v2.17.11/axel-2.17.11.tar.gz
tar -xzf axel-2.17.11.tar.gz
mkdir axel
cd axel-2.17.11
./configure --prefix=$HOME/app/axel
make && make install
cd ~/app
rm -rf axel-2.17.11

# 安装ag
git clone https://mirror.ghproxy.com/https://github.com/ggreer/the_silver_searcher.git
mkdir ag
cd the_silver_searcher
./build.sh
./configure --prefix=$HOME/app/ag
make && make install
cd ~/app
rm -rf the_silver_searcher

# 安装duf
mkdir duf && cd duf
wget -c https://gh.ddlc.top/https://github.com/muesli/duf/releases/download/v0.8.1/duf_0.8.1_linux_x86_64.tar.gz
tar -xzf duf_0.8.1_linux_x86_64.tar.gz
cd ~/app
#mv duf_0.6.2_linux_x86_64 duf

# bat
wget -c https://gh.ddlc.top/https://github.com/sharkdp/bat/releases/download/v0.21.0/bat-v0.21.0-i686-unknown-linux-gnu.tar.gz
tar -xzf bat-v0.21.0-i686-unknown-linux-gnu.tar.gz
mv bat-v0.21.0-i686-unknown-linux-gnu bat

# 安装exa
mkdir exa && cd exa
wget -c https://gh.ddlc.top/https://github.com/ogham/exa/releases/download/v0.10.1/exa-linux-x86_64-v0.10.1.zip
unzip exa-linux-x86_64-v0.10.1.zip
#mv exa-linux-x86_64-v0.10.1 exa
cd ~/app

# 安装fd
wget -c https://gh.ddlc.top/https://github.com/sharkdp/fd/releases/download/v8.4.0/fd-v8.4.0-x86_64-unknown-linux-gnu.tar.gz
tar -xzf fd-v8.4.0-x86_64-unknown-linux-gnu.tar.gz
mv fd-v8.4.0-x86_64-unknown-linux-gnu fd

# 安装tmux
## 先安装依赖
wget -c https://gh.ddlc.top/https://github.com/libevent/libevent/releases/download/release-2.1.12-stable/libevent-2.1.12-stable.tar.gz
tar -xzf libevent-2.1.12-stable.tar.gz
mkdir libevent
cd libevent-2.1.12-stable
./configure --prefix=$HOME/app/libevent
make && make install
echo "export LD_LIBRARY_PATH=$HOME/app/libevent/lib/:$LD_LIBRARY_PATH" >> ~/.zshrc
source ~/.zshrc
cd ~/app

## 安装tmux
wget -c https://gh.ddlc.top/https://github.com/tmux/tmux/releases/download/3.3a/tmux-3.3a.tar.gz
tar -xzf tmux-3.3a.tar.gz
mkdir tmux
cd tmux-3.3a
LIBEVENT_PATH=$HOME/app/libevent
./configure --prefix=$HOME/app/tmux CFLAGS="-I$LIBEVENT_PATH/include" LDFLAGS="-L$LIBEVENT_PATH/lib"
make && make install
cd ~/app

# zshrc配置文件
echo "
# htop
alias htop='$HOME/app/htop/bin/htop'

# duf
alias duf='$HOME/app/duf/duf'

# ag
alias ag='$HOME/app/ag/bin/ag'

# axel
alias axel='$HOME/app/axel/bin/axel'

# exa
alias exa='$HOME/app/exa/bin/exa'

# bat
alias bat='$HOME/app/bat/bat'

# fd
alias fd='$HOME/app/fd/fd'

# tmux
alias tmux='$HOME/app/tmux/bin/tmux'

# alias
alias ls='exa'
alias ll='exa -lh'
alias la='exa -la'" >> ~/.zshrc
