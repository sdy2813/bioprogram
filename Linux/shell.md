# shell编程基础

## 编程起步

### 脚本结构
+ #! 调用shell（指定执行脚本的shell）。
+ # 进行注释。
+ 命令和控制结构。
+ shell 命令，可以按照分号分隔，也可以按照换行符分隔。
+ 如果想在一行中写入多个命令，可以通过分号（;）分隔。


### 调用shell
在向脚本中添加任何其他内容之前，用户需要告诉系统将要启动一个shell 脚本。

使用shebang 结构，如：#!/bin/bash 告诉系统接下来的命令由bash shell 执行。shebang 是因为# 称为hash，! 称为bang。


### 特殊字符
+ \# 用于注释
+ '' 被引起的字符全部做普通字符，即全部原样echo 'my $SHELL'
+ "" 引号内的内容，除$、转义符\、倒引号`这三个保留特殊功能，其他字符均做普通字符。
+ `` (数字1键旁边的那个键）引号内的字符串当做shell命令行解释执行（同样的功能也可以使用$()来使用），得到的结果取代整个倒引号括起来的部分。
+ \ 反斜线是转义字符，它能把特殊字符变成普通字符。在某个字符前面利用反斜杠（\）能够阻止shell把后面的字符解释为特殊字符。
+ $( ) 可以将命令替换输出赋值给变量
+ {} 通过括号扩展可以生成需要的字串，括号中可以包含连续的序列或使用逗号分隔的多个项目，连续的序列包括一个起点和一个终点

### 变量

#### 1. 系统环境变量
在 Shell 脚本中可以直接访问系统中的环境变量，以获取相关的系统信息（如计算机名称，当前登录用户的账户名、 UID 和主目录等）。其值不随shell 脚本的执行结束而消失。

在bash shell 中，默认情况下将变量视作文本字符串。通过在变量名前加一个美元符号$ 来访问该变量的值。
```bash
#!/bin/bash

echo User info for userid: $USER
echo UID: $UID
echo HOME: $HOME
```
PS：由于在 Shell 脚本中，$ 作为变量的前缀符，所以当需要在文本输出中显示 $ 时，应使用转义。


#### 2. 用户自定义变量
Shell 脚本允许用户自行定义和使用变量，这样就可以将脚本中用到的数据临时存储在指定的变量中，使用时再通过 $变量名 的形式获取。

+ 变量赋值：var=value （注意 = 号两边不能有空格，即 var = value 是错误的）
+ 变量使用：$var

PS：Shell 脚本中的变量名区分大小写;Shell 脚本会自动判断变量值的数据类型;变量的有效性贯穿脚本的整个生命周期，即脚本执行完毕后变量会自行删除

```bash
#!/bin/bash

days=10
guest="Katie"
echo "$guest checked in $days days ago"
```

#### 特殊变量
变量 | 使用 | 功能
:--:|:--:|:--
?  | $?  | 上一个命令的退出状态
$  | $$  | 当前shell 进程的PID
!  | $!  | 后台运行的上一个命令的PID
0  | $0  | 当前脚本的文件名
\#  | $#  | 传递给脚本的参数个数
1-9  | $1  | 传递给脚本的第1（2,3,…,9）个参数
\*  | $*  | 传递给脚本的所有参数（作为一个单词）
@ | $@  | 传递给脚本的所有参数的列表
\_  | $_  | 上一个命令的最后一个参数



### 从键盘读取输入
用户可以通过read 命令读取键盘的输入值为变量赋值。
```bash
# read读取键盘输入，并赋值给变量PERSON
echo "What is your name?"
read PERSON
echo "Hello, $PERSON"
```



## 高级概念
### 命令替换
Shell 脚本最有用处的特性之一，就是它可以提取某个命令的输出信息，并将其赋值给一个变量。  
可以通过以下两种方式将命令输出赋值给变量：

+ 反单引号（`）
+ $() 格式

```bash
# 如果命令执行结果有多行内容，存入变量并打印时换行符会
丢失：
cat test.txt
#a
#b
#c
CONTENT=`cat test.txt`
echo ${CONTENT}
#a b c

#若需要保留换行符，则在打印时必须加上""：
CONTENT=`cat test.txt`
echo "${CONTENT}"
#a
#b
#c

```
### $(())与$()还有${}差在哪
在bash shell中, $()与\` \`(反引号)都是用来做命令替换(command substitution)的。
${}吧...它其实就是用来做 变量替换用的啦。 一般情况下，$var与${var}并没有啥不一样。 但是用${}会比较精准的界定变量名称的范围，
${}用于匹配和字符的提取
假设我们定义了一个变量file为：

file=/dir1/dir2/dir3/my.file.txt
我们可以用${}分别替换获得不同的值：

```bash
# shell 字符串的非贪婪(最小匹配)左删除

${file#*/}  # 拿掉第一个/及其左边的字符串，其结果为： dir1/dir2/dir3/my.file.txt 。
${file#*.}  # 拿掉第一个.及其左边的字符串，其结果为： file.txt 。

# shell 字符串的贪婪(最大匹配)左删除

${file##*/} # 拿掉最后一个/及其左边的字符串，其结果为： my.file.txt
${file##*.} # 拿掉最后一个.及其左边的字符串，其结果为： txt

# shell 字符串的非贪婪(最小匹配)右删除

${file%/*}  # 拿掉最后一个/及其右边的字符串，其结果为： /dir1/dir2/dir3。
${file%.*}  # 拿掉最后一个.及其右边的字符串，其结果为： /dir1/dir2/dir3/my.file。

# shell 字符串的贪婪(最大匹配)右删除

${file%%/*}  # 拿掉第一个/及其右边的字符串，其结果为： 空串。
${file%%.*}  # 拿掉第一个.及其右边的字符串，其结果为： /dir1/dir2/dir3/my。

```
记忆方法：

+ #是去掉左边(在键盘上#在$的左边);
+ %是去掉右边(在键盘上%在$的右边);
+ 单个符号是最小匹配;
+ 两个符号是最大匹配;


#### shell字符串取子串
```bash
${file:0:5} #提取最左边的5个字符：/dir1
${file:5:5} #提取第5个字符及其右边的5个字符:/dir2
```
shell 字符串取子串的格式：`${s:pos:length}`, 取字符串 s 的子串：从 pos 位置开始的字符(包括该字符)的长度为 length 的的子串； 其中pos为子串的首字符，在 s 中位置； length为子串的长度；

#### shell 字符串变量值的替换
shell 字符串变量值的替换格式：

首次替换： ${s/src_pattern/dst_pattern} 将字符串s中的第一个src_pattern替换为dst_pattern。
全部替换： ${s//src_pattern/dst_pattern} 将字符串s中的所有出现的src_pattern替换为dst_pattern.
```bash
${file/dir/path}  #将第一个dir替换为path：/path1/dir2/dir3/my.file.txt
${file//dir/path} #将全部的dir替换为path：/path1/path2/path3/my.file.txt
```







### 输入输出重定向
#### 1. 输出重定向
最基本的重定向，就是通过大于号（>），将某个命令的输出内容保存至一个文件中。

格式：command > outputfile
```bash
$ date > current_date.txt
$ ls -l current_date.txt
-rw-r--r--  1 starky  staff  29 Nov  1 01:29 current_date.txt
$ cat current_date.txt
Thu Nov  1 01:29:45 CST 2018
PS：如使用重定向时，指定的文件已存在，则该文件的原始内容会被新内容覆盖。
如果只是想在文件末尾追加内容，则可以使用双大于号（>>）

$ date >> current_date.txt
$ cat current_date.txt
Thu Nov  1 01:29:45 CST 2018
Thu Nov  1 01:34:03 CST 2018
```

#### 2. 输入重定向
输入重定向和输出重定向相反。即从文件中读取内容，并将该内容传递给某个命令。

格式：command < inputfile
```bash
$ ls -l /Users/starky
total 49864
drwx------@  3 starky  staff        96 Oct 13 18:00 Applications
drwx------+ 23 starky  staff       736 Oct 31 19:14 Desktop
drwx------+ 21 starky  staff       672 Oct 31 19:15 Documents

$ cat directory.txt
/Users/starky
$ ls -l < directory.txt
total 49864
drwx------@  3 starky  staff        96 Oct 13 18:00 Applications
drwx------+ 23 starky  staff       736 Oct 31 19:14 Desktop
drwx------+ 21 starky  staff       672 Oct 31 19:15 Documents
drwx------+ 37 starky  staff      1184 Oct 30 20:18 Downloads
drwx------+ 72 starky  staff      2304 Oct 27 01:38 Library
drwx------+  6 starky  staff       192 Oct 29 10:34 Movies
drwx------+  3 starky  staff        96 Sep 27 13:13 Music
```



