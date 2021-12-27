# 压缩解压的常用操作

## 前言
Linux常用命令中，有很多用于对文件的压缩或解压，本文将介绍这些解压缩命令中不常见却非常实用的用法。

## tar
tar是linux中最常用的解压缩命令。tar命令可用于处理后缀名为tar，tar.gz，tgz，.tar.Z，tar.bz2的文件。
涉及参数说明：
```bash
-c 建立新的压缩文件
-r 添加文件到已经压缩的文件
-u 添加改变了和现有的文件到已经存在的压缩文件
-x 从压缩的文件中提取文件
-t 显示压缩文件的内容
-z 支持gzip解压文件
-j 支持bzip2解压文件
-v 显示操作过程
-k 保留源有文件不覆盖
-C 切换到指定目录
-f 指定压缩文件

--delete            删除包中文件
--strip-components  去除目录
--add-file          向包中添加文件
```

### 压缩
#### 归档tar包，不压缩
```bash
tar -cvf test.tar test1.log test2.log #归档多个文件
tar -cvf test.tar test/* 　#归档test目录下所有文件
tar -cvf test.tar *.log 　#归档所有以.log结尾的文件
```
由于这种方式不会进行压缩，仅做了归档，因此速度极快，同时占用空间也较大。

#### 归档并压缩为tar.gz或tar.bz2
这种方式打包对文件进行了压缩：
```bash
tar -zcvf test.tar.gz file1 file2 #打包，并以gzip压缩
tar -jcvf test.tar.bz2 file1 file2 #打包，并以bzip2压缩
```
#### 查看压缩包中的文件
如果不想解压，只是想查看压缩包中的文件内容，可以使用-t参数：
```bash
tar -tvf test.tar #可查看test包中有哪些文件
```
#### 打包后删除源文件
有时候在打包后可能需要删除源文件，但一个个删除显得麻烦，我们可以使用--remove-files 选项：
```bash
tar -zcvf test.tar.gz test.log --remove-files 
```
#### 打包除指定目录或文件以外的文件
对于某些目录下的文件，可能只需要打包部分文件，因此可以使用--exclude选项排除一些不需要打包的文件：
```bash
tar -zcvf test.tar.gz --exclude=test/*.log test/* #打包test目录下所有文件，排除以.log结尾的文件
```
这里用到了--exclude选项，支持通配符和正则表达式，因此也非常强大。

#### 向压缩包中更新文件
例如，压缩包中已经打入了test以及其他文件，现在你只想更新压缩包中的test文件，那么你可以使用--add-file选项：
```bash
tar -tf test.tar --add-file=test #只针对tar包
```
#### 向tar包中增加文件
向tar包中增加文件可使用-r参数：
```bash
tar -rf test.tar testfile #在test.tar包中增加文件，只针对tar包
```
#### 删除压缩包中的文件
在不解压的情况下，可使用--delete选项删除包中的文件：
```bash
tar --delete -f test.tar  test1 #从test.tar中删除test1文件
```
### 解压
解压tar.gz和tar包到当前目录
```bash
tar -xvf test.tar.gz
tar -xvf test.tar 
```
#### 解压到指定目录
```bash
tar -xvf test.tar.gz -C dir
tar -xvf test.tar -C dir
```
#### 解压包中指定的文件
例如test.tar.gz包中文件情况如下：
```bash
1.txt
log/
log/1.log
log/2.log
log/2.log
log/4.log
log/5.log
如果我们只需要解压出log目录下的1.log，只需要执行下面的命令：
```bash
tar -xvf test.tar.gz log/1.log
tar -xvf test.tar.gz log/1.log -C test #将1.log解压到test目录
```
#### 解压时去掉目录结构
压缩包中的文件可能存在多级目录，常规方式解压出来后，对应目录也会存在。如果只想要压缩包的文件，可以去掉目录结构（注意：同一文件夹下文件名不能重）：
```bash
tar -xvf test.tar.gz --strip-components=1 #去掉一层目录
```
#### 解压时不覆盖原文件
当前目录可能已经存在包中的文件，如果不想解压出来的文件覆盖当前已存在的文件，可使用-k参数（会抛出错误信息）：
```bash
tar -xvkf test.tar.gz
```
#### 特别提醒
前面所提到的解压或者压缩带的f参数需要放在最后，因为它指定了压缩包名字，否则会出现解压或压缩失败。

## zip/unzip
zip和unzip命令主要用于处理zip包。


### 压缩
涉及参数说明：
```bash
-d 从压缩文件内删除指定的文件。
-f 此参数的效果和指定"-u"参数类似，但不仅更新既有文件，如果某些文件原本不存在于压缩文件内，使用本参数会一并将其加入压缩文件中。
-j 只保存文件名称及其内容，而不存放任何目录名称。
-r 递归处理，将指定目录下的所有文件和子目录一并处理。
-u 更换较新的文件到压缩文件内。
-v 显示指令执行过程或显示版本信息。
-y 直接保存符号连接，而非该连接所指向的文件，本参数仅在UNIX之类的系统下有效。
- <压缩效率> 压缩效率是一个介于1-9的数值。
```
#### 压缩文件
```bash
zip -r test.zip test/ #打包test目录下的文件
zip -rj test.zip test/ #打包test目录下文件，且压缩包不带test目录
```
#### 指定压缩率打包文件
```bash
zip -r8 test.zip test/* #数值（1-9）越大，压缩率越高，耗时越长
```
#### 打包符号链接文件
前面的命令只能打包普通文件，如果想要打包符号链接文件，则需要使用参数-y：
```bash
zip  -ry test.zip test
```
#### 向压缩包中增加或更新文件
有时候需要向压缩包中增加文件，但又不想重新解压打包，可以使用参数-u：
```bash
zip -u test.zip test2 #向test.zip 包中增加test2文件
```
#### 压缩时加密
压缩时如果需要对压缩包进行加密，可使用-P参数：
```bash
zip -r test.zip test1 test -P 66666 #使用密码66666加密
```
#### 删除压缩包的特定文件
```bash
zip -d test.zip test  #删除test.zip包中的test文件
```
### 解压
涉及参数说明：
```bash
-l 显示压缩文件内所包含的文件
-j 只保存文件名称及其内容，而不存放任何目录名称。
-o 以压缩文件内拥有最新更改时间的文件为准，将压缩文件的更改时间设成和该
-v 显示指令执行过程或显示版本信息。
-d 指定解压目录，目录不存在会创建
```
#### 查看压缩包中的文件信息
```bash
unzip -l test.zip #可以看到压缩包中的文件名，日期等信息
unzip -v test.zip #查看更多信息，例如crc校验信息等
```
#### 解压压缩包
```bash
unzip -o test.zip -d dir #讲test.zip解压到dir目录
```
#### 解压包中指定的文件
如果不知道需要解压的文件名，可先查看包中的文件，然后使用下面的方法：
```bash
unzip -o test.zip "1.log" -d dir #解压包中的1.log文件到dir目录
unzip -o tet.zip "*.log" -d dir  #解压包中所有的log文件
```
#### 解压时去掉目录结构
压缩包中有多层目录结构，普通解压仍然会保留目录结构，如果只想要压缩包中的文件，可以使用-j参数:
```bash
zip -oj test.zip -d ./temp  
```
#### 解压jar包
jar包是java归档包，但同样可用unzip解压查看里面的文件：
```bash
unzip -o java.jar -d dir
```
## gzip
涉及参数说明：
```bash
-k 保留源文件
-d 解开压缩文件
-r 递归处理，将指定目录下的所有文件及子目录一并处理
-v 显示指令执行过程
tar命令带有-z参数，并且打包成tar.gz文件时，便调用gzip进行了压缩。gzip对文本的压缩率约有60%~70%，压缩包文件常以gz为后缀。使用-k参数保留源文件：
```bash
gzip -k ./* #当前目录下所有文件进行压缩，每个文件一个gz包
gzip -rkv ./* 递归压缩
```
解压也很简单：
```bash
gzip -dv test.gz 
```
## bzip2
tar命令使用-j参数将文件打包为tar.bz2时，便调用了bzip2进行压缩。bzip2压缩或解压后，会将源文件删除。如果需要保留源文件，可使用-k参数：
```bash
bzip2 -zk test  #压缩test文件
bzip2 -dk test.bz2  #解压
```
## rar/unrar
rar和unrar命令并非linux发行版自带命令，需要另外安装。常见用法如下：
```bash
rar a test.tar test  #将test文件压缩为test.tar
rar e test.rar       #解压test.tar
unrar x test.rar     #解压test.tar
```
## 压缩率比较
压缩率一般来说：
```bash
tar.bz2>tar.gz>zip>tar
```
压缩率越高，压缩以及解压的时间也就越长。

## 总结
对文件进行压缩能够节省磁盘空间，进行网络传输时，也能节省带宽，但是需要注意的是，空间和时间是需要根据实际应用进行权衡的。解压缩命令较多，为避免在其他平台使用不便，可选择常用命令进行压缩文件。
