# 基本操作之awk

## 基本介绍
Awk是一种小巧的编程语言及命令行工具。（其名称得自于它的创始人Alfred Aho、Peter Weinberger 和 Brian Kernighan姓氏的首个字母）。它非常适合服务器上的日志处理，主要是因为Awk可以对文件进行操作，通常以可读文本构建行。
![](https://img.linux.net.cn/data/attachment/album/201502/09/205716uph3b7dlvzgdpykc.jpg)

## 使用方法
```bash
# awk指令是由模式、动作，或者模式和动作的组合组成。
awk '{pattern + action}' {filenames}
```
![](https://mmbiz.qpic.cn/mmbiz_png/9aPYe0E1fb0VAiaysoCX4stsnE05XCdEwib06lOxoGAOW3U74cZjJAfE6tU1fK0MYLtZ5mO9TS3icMfZqib9TNgWdw/640?wx_fmt=png&tp=webp&wxfrom=5&wx_lazy=1&wx_co=1)
![](https://mmbiz.qpic.cn/mmbiz_png/9aPYe0E1fb0VAiaysoCX4stsnE05XCdEwMibpicGPZLWuULvT7IYU4QeZFVtkI15HYcnDLzHkYFgXrEsoibaEC1iaUg/640?wx_fmt=png&tp=webp&wxfrom=5&wx_lazy=1&wx_co=1)

一个栗子：
```bash
cat awk.txt
# ABC#DEF#GHI#GKL$123
# BAC#DEF#GHI#GKL$213
# CBA#DEF#GHI#GKL$321

awk -F "#" 'NR==1{print $1}' awk.txt
# ABC

# NF（number of field）表示一行中的区域（列）数量，$NF取最后一个区域。
# $符号表示取某个列（区域），如$1,$2,$NF
# NR (number of record) 行号,awk对每一行的记录号都有一个内置变量NR来保存，每处理完一条记录NR的值就会自动+1.默认处理所有行。
# FS（-F）field separator 指定列分隔符，以什么把行分隔成多列

# 显示包含321的行
awk '/321/{print $0}' awk.txt
# CBA#DEF#GHI#GKL$321
```

## 栗子
```bash
awk '{if(/^#/){print $0}}' target.gff|head
# //：表示匹配；^#：表示开头为#的，因此/^#/表示匹配开头为#号。if(/^#/){print $0}串起来就是: 如果是以#开头，那么打印整行。
```

对于不是#开头的行，我们需要对其进行分列，并对6、7列与第2列相加后减1。
```bash
awk 'BEGIN {FS="[-:\t]";OFS="\t"}{if(/^#/){print $0}else{$6=$6+$2-1;$7=$7+$2-1;print $0}}' target.gff
# FS是输入字段分隔符，中括号里边的分隔符的关系是“或”。即遇到-或者:或者\t，都作为分隔符分开。
# OFS是输出字段分隔符。这里指定的是tab分隔。
# BEGIN是为awk提供启动的操作。具体在本案例而言，就是告诉awk，我后边的FS是-:\t，OFS是"\t"。
# else后边一串就是将第6列重新赋值为$$2-1，第7列重新赋值为$$2-1。然后输出整行。
```

将第2、3列去掉
```bash
awk 'BEGIN {FS="[-:\t]";OFS="\t"}{if(/^#/){print $0}else{$6=$6+$2-1;$7=$7+$2-1;$2=$3="";print $0}}' target.gff|more
# 看起来似乎第2、3列似乎是没了。但是其实它们只是为空，我们看不到而已。
```

最后方案
```bash
awk 'BEGIN {FS="[-:\t]";OFS="\t"}{if(/^#/){print $0}else{$6=$6+$2-1;$7=$7+$2-1;$2=$3="";sub(/\t+/,"\t");print}}' target.gff  > output.gff
# sub(/\t+/,"\t")就是使用sub进行字符串替换。将多个tab替换成单个tab。
```

## awk模块、变量与执行



计算多行数值求和
```bash
awk '{sum+=$1} END {print sum}' filename
```


---
相关教程
+ [AWK简明教程](https://coolshell.cn/articles/9070.html)
+ [Linux 三剑客之 awk 详解](https://mp.weixin.qq.com/s?__biz=MzAxODI5ODMwOA==&mid=2666545074&idx=1&sn=7a6f86ae45c5e7254b71da7fcbbdef8d&chksm=80dcfb19b7ab720ff5ffc78d77092b805c54b22839e02fbf4741f06be90845552172258ac978&scene=0&xtrack=1#rd)
+ [AWK 技巧（取倒列，过滤行，匹配，不匹配，内置变量等）](https://www.cnblogs.com/kevingrace/p/8481965.html)








