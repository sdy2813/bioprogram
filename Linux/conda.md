# <center>基本操作之conda</center>

## 目录
* [conda下载安装并添加源](#conda下载安装并添加源)
* [conda环境的创建](#cconda环境的创建)
* [conda安装包](#conda安装包)
* [mamba](#mamba)
* [conda 管理R包](#conda管理R包)

## conda下载安装并添加源
```bash
# 下载
wget -c https://mirrors.tuna.tsinghua.edu.cn/anaconda/archive/Anaconda3-2020.07-Linux-x86_64.sh

## mambaforge
https://download.nuaa.cf/conda-forge/miniforge/releases/download/latest/Mambaforge-Linux-x86_64.sh

# 安装与miniconda一样，只是自带mamba

# 安装
bash Anaconda3-2020.07-Linux-x86_64.sh

# 配置
echo export PATH=/home/xum/anaconda3/bin:$PATH >> .bashrc

# 设置镜像，同时添加bioconda仓库，涉及的配置文件为 ~/.condarc
# 建议添加官方源，源不要太多。添加Bioconda通道时，注意顺序，给予conda-forge最高优先级，其次是bioconda。如果之前已经添加好了通道，自己在~/.condarc中调整顺序。
# 清华源
conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/free/
conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/main/
conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud/conda-forge/
conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud/bioconda/
conda config --set show_channel_urls yes

# 官方源
conda config --add channels r
conda config --add channels bioconda
conda config --add channels conda-forge

# 查看当前配置哪些源
conda config --show channels

# 删除源
conda config --remove channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/free/
```

## conda环境的创建
```bash
# 新建一个专用环境（环境名字自己选定即可）
# 其中 -n 代表 name，env_name 是需要创建的环境名称，list of packages 则是列出在新环境中需要安装的工具包。
conda create -n env_name  list of packages

# 激活该环境
source activate bx_exp

# 进行后续实验，实验结束后，退出环境：
source deactivate bx_exp

# 如果不需要这个环境了，可以删除该环境
conda env remove -n new_env

# 显示所有的环境：
conda env list
```

## conda安装包
```bash
# conda搜索包，会显示包的版本和源
conda search edger

# 可以指定安装包的版本
conda install numpy=1.10

# 查看所有package
conda list

# 更新包
conda update pack_name

# 更新全部包
conda update --all

# 移除一个包
conda remove package_name
```

## mamba
```bash
# 据说可以加快包的安装，因为拿C++重写的，可试试
conda install -c conda-forge mamba

mamba install *
```

## conda管理R包
有些时候，默认的R安装环境对安装某些包不是很友好，此时可以考虑用conda新建一个R环境，并用conda来搜索和安装R包，不用了就可以删掉，似乎来的更快一些。
```bash
# 利用conda搜索R
conda search r-base

# 新建R环境
conda create -n R r-base=4.0.0

# 安装R包
conda search edger
```




## Conda环境导出和导入
```bash
# 假设我们有一个环境叫 bioapp，可以导出为一个yml文件
conda env export --file bioapp.yml --name bioapp

# 然后换一台电脑，就可以完全重现这个环境了
# 这么做的另一个优势是yml中明确列出了软件的版本，
# 使用 conda solving environment时速度会快很多
conda env create -f bioapp.yml
```

## 使用conda-pack直接从已经安装好的地方拷贝一份 (同一操作系统)
```bash
# 安装 conda-pack
mamba install -c conda-forge conda-pack

# 打包已经安装好的环境
conda pack -n my_env_name -o my_env_name.tar.gz

# 拷贝打包好的环境my_env_name.tar.gz到目标机器，并解压到任何目录，一般推荐放到envs目录下 (anaconda_root/envs)。(注意：anaconda_root改为自己的conda安装路径。)

# 解压打包好的环境
# 默认是全都解压到当前目录，场面很壮观
# -C 一定要指定
mkdir -p anaconda_root/envs/my_env
tar -xzf my_env.tar.gz -C anaconda_root/envs/my_env

# 激活环境
mamba activate my_env/bin/activate

# Unpack
conda-unpack

# 至此环境就完全拷贝过来了
mamba deactivate
```







---
参考资料
1. [anaconda 安装指定源的包](https://www.cnblogs.com/lovychen/p/11738883.html)

2. [如何使用yml文件重新创建conda环境？](https://www.coder.work/article/2015418)




















