# <p align="center">在服务器部署*code-server*</p>

vscode可以把它理解为一个次于专门的IDE，但有胜过简单文本编辑器的一个存在，而code-server则是其server版，类似于RStudio-server.
下面简单介绍一下如何在服务器中部署code-server

## 下载安装
```bash
# 如果有超级用户权限，最好还是去官网下载安装包，自己安装，不费事。

# 非root用户首选方法是去GitHub上下载压缩包自己编译


# 非root用户简单安装方法-- conda安装
conda search code-server

conda install -c conda-forge code-server



```

## 运行
```bash
code-server

# 会在家目录底下的.config文件夹内生成code-server文件夹，去里面改参数
第一行改为服务器地址和自己设定的端口
第三行改为自己记得住的密码
```

## 后台运行

```bash
# 设置完成后，终止程序
# 新建tmux 会话（screen也许）
tmux new -s code
# 分割会话
tmux split-windows -h
# 在会话里运行
code- server
# 退出会话
tmux detach

```
到此为止应该可以在浏览器上打开code-server了

## python环境搭建

在拓展商店安装python插件，回头写python脚本时就可以激活这个脚本，在底下状态栏可以选择使用服务器的哪个python解释器。后面就可以作为python的IDE来使用了





