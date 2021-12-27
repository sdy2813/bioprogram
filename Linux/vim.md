# 常用的vim操作

## 代码快速注释与反注释
```vim
# 注释
:1,10s/^/#/g

# 反注释
:1,10s/^#//g
```
## 基本使用
### 移动定位
命令|说明|结果
:--:|:--:|:--
0 |零|光标移至行首
^ |— |光标移至行首（第一个非空字符）
$ |美元符号|光标移至行尾
\+ |加号|光标移至下一行行首
\- |减号|光标移至上一行行首
gg |两个小写g |光标移至第一行（:0）
G |大写G |光标移至最后一行（:$）
nG |G 前加数字|光标移至指定行
:n |冒号后跟数字|光标移至指定行


### 编辑文件
命令|说明|结果
:--:|:--:|:--
i |小写i| insert，在光标前插入
I |大写I |在行首处插入
a |小写a |append，在光标后插入
A |大写A |在行尾处插入
o |小写o |在光标所在行的下面插入新行
O |大写O |在光标所在行的上面插入新行
2O |命令前加数字|在光标所在行的上面插入两个新行
x |小写x |删除光标所在位置的字符
X |大写X |删除光标前的字符
dw |小写dw |从光标处删除至下一个单词
d^ |— |从光标前删除至行首
d$| — |从光标处删除至行尾
dG |— |从光标所在行删除至最后一行
D |大写D |从光标处删除至行尾
dd |小写dd |删除光标所在行
3x |命令前加数字|删除光标所在位置开始的后3 个
3dd, d3d  |命令前加数字 |删除3 行
:m,nd  |—  |从第m 行删除到第n 行
ddO  |组合命令 |删除光标所在行并创建新行
cc  |两个小写c | 修改光标所在行
cw  |小写cw | 修改光标所在的单词（光标处至单词结束），进入输入模式
r  |小写r | 替换光标处的字符，替换后返回命令模式
R  |大写R | 从光标处开始替换字符，直至按Esc 停止
s  |小写s | 替换光标处的字符，替换后处于输入模式
S  |大写S | 替换光标所在行，替换后处于输入模式
J   |大写J  | 合并光标所在行和其下一行
yy   |两个小写y  | 复制光标所在行
Y   |大写Y  | 复制光标所在行
yw   |小写yw   |复制光标所在的单词（光标处至单词结尾）
p   |小写p  | 在光标后粘贴
P   |大写P  | 在光标前粘贴
3yy, y3y   |命令前加数字  |复制从光标所在行开始的3 行内容
u |小写u |撤销最近一次的编辑
U |大写U |撤销光标所在行的所有编辑
Ctrl+R |同时按下Ctrl 和R 键|重做
. |句点|重复上一个命令

### 搜索替换
命令|结果
:--:|:--
/word |从光标处向下搜索word
?word |从光标处向上搜索word
n |同向定位下一个搜索
N |反向定位下一个搜索
:s/old/new/ |将光标所在行上的第一个old 替换为new
:s/old/new/g |globally，将光标所在行的所有old 替换为
new
:s/old/new/c |替换时进行确认
:m,ns/old/new/g |将从第m 行到第n 行的所有old 替换为
new
:1,$s/old/new/g |将整个文件内的所有old 替换为new
:%s/old/new/g |将整个文件内的所有old 替换为new
:%s/\<old\>/new/g |将整个文件内的所有old 单词替换为new
默认 |对光标所在行进行操作
m,n  |在从第m 行到第n 行范围内进行操作
%  |在整个文件内进行操作
/g  |globally，对所有匹配进行替换
/c  |每次替换前进行询问确认
:m,ns/^/#/g  |进行连续行注释
:m,ns/^#//g  |删除连续行注释
&  |重复最后一个替换命令（:s）

# 退出保存
命令|结果
:--:|:--
:q  |未修改，退出Vim 编辑器
:w  |写入修改，保存当前文件
:w  |filename 文件另存为filename
:wq  |保存文件并退出
ZZ  |同:wq
:x  |保存文件并退出
:q!  |放弃对文件的修改并退出
:w!  |filename 覆盖文件
:wq!  |保存修改并退出（文件所有者可忽略文件的只读属性）


## 基本配置
### 基础配置
```vim
set nocompatible                " nocompatible 用于关闭 compatible，表示不与 Vi 兼容
set autoread                    " autoread 表示如果当前文件在 Vim 外被修改且未在 Vim 里面重新载入的话，则自动重新读取
set shortmess=atI               " shortmess 选项用于设置Vim缩短消息长度的标志位列表，例如，shortmess=m 表示用 “[+]” 代替 “[Modified]”
                    
set magic                       " magic 选项用于改变搜索模式使用的特殊字符
set title                       " title 用于设置 Vim 窗口标题
set nobackup                    " nobackup 用于关闭 backup，设置覆盖文件时不保留备份文件
set noswapfile                  "不创建交换文件。交换文件主要用于系统崩溃时恢复文件，文件名的开头是.、结尾是.swp

set noerrorbells                " 用于关闭 errorbells 选项，表示 Vim 有错误信息时不响铃
set visualbell t_vb=            " 表示使用可视响铃代替鸣叫，而显示可视响铃的终端代码由 t_vb 选项给出
set t_vb=           
set timeoutlen=500              " 表示以毫秒计的等待键码或映射的键序列完成的时间
```

### 编码设置
```vim
set encoding=utf-8              "  设置 Vim 内部使用的字符编码，它应用于缓冲区、寄存器、表达式所用的字符  
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1              " 设置一个字符编码的列表，表示 Vim 自动检测文件编码时的备选字符编码列表
set fileformats=unix,dos,mac    " 用于设置参与自动检测换行符 () 格式类型的备选列表
set termencoding=utf-8          " 用于设置终端使用的编码方式 
set formatoptions+=m            " 表示自动排版完成的方式,m 表示在任何值高于 255 的多字节字符上分行
set formatoptions+=B            " 表示自动排版完成的方式,B 表示在连接行时，不要在两个多字节字符之间插入空格
```

### 界面显示设置
```vim
set ruler                       " 在状态栏显示光标的当前位置（位于哪一行哪一列）
set number                      " 显示行号
set nowrap                      " 设置超过窗口宽度的行不自动回绕显示
set showcmd                     " 用于设置在屏幕最后一行显示 (部分的) 命令                                                                                         
set showmode                    " 在插入、替换和可视模式里，在最后一行提供消息
set showmatch                   " 光标遇到圆括号、方括号、大括号时，自动高亮对应的另一个圆括号、方括号和大括号
set matchtime=2                 " 匹配括号的时间
```
### 查找配置
```vim
set hlsearch                    " 设置将搜索结果高亮显示
set incsearch                   " 让 Vim 根据已经在查找域中输入的文本，预览第一处匹配目标；每当新输入一个字符时，Vim 会即时更新预览内容
set ignorecase                  " 忽略大小写
set smartcase                   " 当 ignorecase 和 smartcase 选项均打开时，如果搜索模式中包含大写字母，Vim就会认为当前的查找(搜索)是区分大小写的。如果搜索模式中不包含任何大写字母，Vim 则会认为搜索应该不区分大小写。这是个比较 ”智能的” 推测你搜索意图的机制
```

### 缩进配置
```vim
set autoindent smartindent shiftround   " autoindent 用于设置新增加的行和前一行具有相同的缩进形式。smartindent 选项用于设置新增行时进行”智能”缩进，主要用于 C 语言一族，与 cindent 选项类似。在Vim smartindent 缩进模式下，每一行都有相同的缩进量，直到遇到右大括号 (}) 取消缩进形式 
set shiftwidth=4                        " 选项用于设置执行Vim普通模式下的缩进操作 ( << 和 >> 命令 )时缩进的列数。而 shiftround 选项则表示缩进列数会自动取整到 ‘shiftwidth’ 选项值的倍数
set tabstop=4                           " 缩进的空格个数
set softtabstop=4                       " insert mode tab and backspace use 4 spaces "
```
### 显示当前光标位置
```vim
set cursorcolumn  " cursorcolumn 设置高亮显示光标当前所在列
set cursorline    " cursorline 设置高亮显示光标所在屏幕行
```

### 其他设置

```vim

syntax on "语法高亮

set mouse=a "支持使用鼠标

set textwidth=80 "设置行宽，即一行显示多少个字符
```

## 安装插件
### 一般操作步骤
```bash
# 安装vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# 修改.vimrc文件
vim ~/.vimrc
Plugin 'VundleVim/Vundle.vim'

# 命令行安装插件
vim +PluginInstall +qall
```
### 移除不需要的插件
+ 编辑.vimrc文件移除的你要移除的插件所对应的plugin那一行，
+ 保存退出当前的vim，
+ 重新打开vim，输入命令BundleClean

### 其他常用命令
+ 更新插件BundleUpdate
+ 列出所有插件BundleList
+ 查找插件BundleSearch


## vim主题更改
Vi/Vim手工自行安装配色方案的主要步骤包括：

1. 确认当前用户目录下存在~/.vim/colors目录，没有则新建，安装的Vim配色方案对应.vim文件需放在该目录下
2. 下载或编辑某个配色方案的.vim文件，保存到~/.vim/colors目录下
3. 修改Vim配置文件~/.vimrc，增加配置项colorscheme molokai并保存 (假设下载了一个叫molokai的配色方案文件molokai.vim)
```bash
git clone https://github.com/morhetz/gruvbox
```
```
"最后更改
syntax enable
set t_Co=256
colorscheme gruvbox
set background=dark "背景色
```

## .vimrc
```vim
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this lin

"在 vim 启动的时候默认开启 NERDTree：
autocmd VimEnter * NERDTree "或使用autocmd的缩写形式 au VimEnter * NERDTree

"将NERDTree的窗口设置在vim窗口的右侧(默认为左侧)
let NERDTreeWinPos="right"
```


