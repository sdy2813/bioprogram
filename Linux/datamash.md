# <p align='center'>Datamash 基本操作</p>

## 使用datamash进行统计分析
使用awk虽然可以进行统计分析，但是需要自己去实现大量的细节，很麻烦。 datamash 则是一个直接提供了基本统计能力的命令行程序。

datamash的使用非常简单，其调用规则为 datamash 选项 统计操作1 数据列1 [统计操作2 数据列2].... 它会对 数据列N 所表示的数据执行 统计操作N. 其中 数据列 一般是一个表示第几列的数字，但是当数据文件中的第一行是标题时，可以通过 -H 选项来指明数据文件中包含标题行，此时 数据列 可以是标题名来代替。

## 常见的选项说明
+ 分组  
datamash支持对数据进行分组统计，通过使用 --group=数据列1[,数据列2,数据列3] 可以指明根据哪几个域进行分组
+ 排序  
datamash需要输入的数据是预先经过排序的，若数据未经过排序则需要通过 --sort 选项预先进行排序
+ 忽略大小写差异  
通过 --ignore-case 选项可以让 datamash 在分组时忽略大小写的差异
+ 设置分隔符  
默认情况下datamash使用 TAB 作为列的分隔符，通过 --field-separator=x 可以设置 x 作为列分隔符，也可以通过 --whitespace 设置使用一个或多个空格或者tab作为分隔符。
+ 转置  
通过 transpose 选项可以交换行列式
+ 反转  
通过 reverse 选项可以反转字段的顺序
+ 跳过空值  
--narm 跳过空域

## 常见的统计操作
+ count  
计算总数据量
+ rand  
随机返回一个值
+ sum  
汇总
+ min  
取最小值
+ max  
取最大值
+ absmin  
取绝对值最小的那个值
+ absmax  
取绝对值最大的那个值
+ range  
值域范围，即max - min
+ mean  
取均值
+ median  
取中位数
+ q1  
取第一四分位
+ q3  
取第三四分位
+ iqr  
取四分位距
+ mode  
取众数
+ antimode  
取最少出现的数
+ pstdev  
总体标准差
+ sstdev  
样本标准差
+ pvar  
总体方差
+ svar  
样本方差
+ pskew  
总体偏度
+ sskew  
样本偏度
+ pkurt  
总体峰度
+ skurt  
样本峰度
+ pcov  
总体协方差，需要两组数据，用 列1:列2 来表示
+ scov  
样本协方差，需要两组数据，用 列1:列2 来表示
+ ppearson  
总体皮尔逊相关系数，需要两组数据，用 列1:列2 来表示
+ spearson  
样本皮尔逊相关系数，需要两组数据，用 列1:列2 来表示

## 软件安装
```bash
# conda 
conda search datamash
conda install -c conda-forge datamash=1.7
```

## 实例
注意：以下使用的文件均来自软件(PATH: datamash-1.3/examples)自带的数据集
```
File: scores.txt
───────┼───────────────────────────────────────────────────────────────────────────────────────────────────────────
   1   │ Shawn   Arts    65
   2   │ Marques Arts    58
   3   │ Fernando    Arts    78
   4   │ Paul    Arts    63
   5   │ Walter  Arts    75
   6   │ Derek   Arts    60
   7   │ Nathaniel   Arts    88
   8   │ Tyreque Arts    74
   9   │ Trevon  Arts    74
  10   │ Nathan  Arts    71
  11   │ Zachary Arts    80
  12   │ Donovan Arts    75
  13   │ Levi    Arts    76
  14   │ Sage    Arts    55
  15   │ Roberto Arts    65
  16   │ William Arts    46
  17   │ Nico    Arts    59
  18   │ Bryan   Arts    68
  19   │ Isaiah  Arts    80
  20   │ David   Business    92
  21   │ Leonard Business    87
  22   │ Tysza   Business    92
  23   │ Darren  Business    94
  24   │ Christian   Business    88
  25   │ Aaron   Business    83
  26   │ Kerris  Business    82
  27   │ Dakota  Business    83
  28   │ Teriuse Business    94
  29   │ Caleb   Business    87
  30   │ Juan    Business    79
  31   │ Andre   Health-Medicine 72
  32   │ Diego   Health-Medicine 82
  33   │ Jonathan    Health-Medicine 100
  34   │ Kevin   Health-Medicine 100
  35   │ Patrick Health-Medicine 92
  36   │ D'Angelo    Health-Medicine 90
  37   │ Daniel  Health-Medicine 91
  38   │ Dilan   Health-Medicine 84
  39   │ Angel   Health-Medicine 100
  40   │ Peter   Health-Medicine 86
  41   │ Dalton  Health-Medicine 100
  42   │ Israel  Health-Medicine 81
  43   │ Gabriel Health-Medicine 100
  44   │ Chase   Social-Sciences 27
  45   │ Leroy   Social-Sciences 74
  46   │ Jesse   Social-Sciences 32
 ```
 
1. Summary Statistics
```
# 先排序，然后根据第二字段分组，最后统计分组中第二字段的元素出现的次数
datamash --sort groupby 2 count 2 < scores.txt
Arts    19
Business        11
Engineering     13
Health-Medicine 13
Life-Sciences   12
Social-Sciences 15

# 先排序，然后根据第二字段分组，最后输出分组中第三字段的最小值和最大值
datamash --sort groupby 2 min 3 max 3 < scores.txt
Arts    46      88
Business        79      94
Engineering     39      99
Health-Medicine 72      100
Life-Sciences   14      91
Social-Sciences 27      90

# 先排序，然后根据第二字段分组，最后输出分组中第三字段的均值和总体标准偏差
datamash --sort groupby 2 mean 3 pstdev 3 < scores.txt
Arts    68.947368421053 10.143567752966
Business        87.363636363636 4.9409739060732
Engineering     66.538461538462 19.10141108205
Health-Medicine 90.615384615385 8.8625266543026
Life-Sciences   55.333333333333 19.728715675944
Social-Sciences 60.266666666667 16.643183456165

# 先排序，然后根据第二字段分组，最后输出分组中第三字段的中位数、第一个四分位数值、第三个四分位数值和四分位差
datamash --sort groupby 2 median 3 q1 3 q3  3 iqr 3  < scores.txt
Arts    71      61.5    75.5    14
Business        87      83      92      9
Engineering     56      51      83      32
Health-Medicine 91      84      100     16
Life-Sciences   58.5    44.25   67.75   23.5
Social-Sciences 62      55      70.5    15.5
```

2. Header Lines and Column Names
```
File: scores_h.txt
───────┼───────────────────────────────────────────────────────────────────────────────────────────────────────────
   1   │ Name    Major   Score
   2   │ Shawn   Arts    65
   3   │ Marques Arts    58
   4   │ Fernando    Arts    78
   5   │ Paul    Arts    63
   6   │ Walter  Arts    75
   7   │ Derek   Arts    60
   8   │ Nathaniel   Arts    88
   9   │ Tyreque Arts    74
  10   │ Trevon  Arts    74
  11   │ Nathan  Arts    71
  12   │ Zachary Arts    80
  13   │ Donovan Arts    75
  14   │ Levi    Arts    76
  15   │ Sage    Arts    55
  16   │ Roberto Arts    65
  17   │ William Arts    46
  18   │ Nico    Arts    59
  19   │ Bryan   Arts    68
  20   │ Isaiah  Arts    80
  21   │ David   Business    92
  22   │ Leonard Business    87
  23   │ Tysza   Business    92
  24   │ Darren  Business    94
  25   │ Christian   Business    88
  26   │ Aaron   Business    83
  27   │ Kerris  Business    82
  28   │ Dakota  Business    83
  29   │ Teriuse Business    94
  30   │ Caleb   Business    87
  31   │ Juan    Business    79
  32   │ Andre   Health-Medicine 72
  33   │ Diego   Health-Medicine 82
  34   │ Jonathan    Health-Medicine 100
  35   │ Kevin   Health-Medicine 100
  36   │ Patrick Health-Medicine 92
  37   │ D'Angelo    Health-Medicine 90
  38   │ Daniel  Health-Medicine 91
  39   │ Dilan   Health-Medicine 84
  40   │ Angel   Health-Medicine 100
  41   │ Peter   Health-Medicine 86
  42   │ Dalton  Health-Medicine 100
  43   │ Israel  Health-Medicine 81
  44   │ Gabriel Health-Medicine 100
  45   │ Chase   Social-Sciences 27
  46   │ Leroy   Social-Sciences 74
  47   │ Jesse   Social-Sciences 32
```

```
#(1) Header Lines
#如果输入文件中没有表头(列标题)，则可以使用 --header-out 在输出文件的第一行添加表头
datamash --sort --header-out groupby 2 min  3 max 3 < scores.txt
GroupBy(field-2)        min(field-3)    max(field-3)
Arts    46      88
Business        79      94
Engineering     39      99
Health-Medicine 72      100
Life-Sciences   14      91
Social-Sciences 27      90

#如果输入文件中有表头(列标题)，则可以使用 --header-in 跳过该行。
datamash --sort --header-in groupby 2 mean 3 < scores_h.txt
Arts    68.947368421053
Business        87.363636363636
Engineering     66.538461538462
Health-Medicine 90.615384615385
Life-Sciences   55.333333333333
Social-Sciences 60.266666666667

#使用 --header/-H 则可以将输入文件中的表头作为输出文件的表头
datamash --sort --headers groupby 2 mean 3 < scores_h.txt
GroupBy(Major)  mean(Score)
Arts    68.947368421053
Business        87.363636363636
Engineering     66.538461538462
Health-Medicine 90.615384615385
Life-Sciences   55.333333333333
Social-Sciences 60.266666666667
#使用-sH 效果等同于 --sort --headers
datamash -sH groupby 2 mean 3 < scores_h.txt

#(2) Column Names
#当输入文件有表头，则也可以使用列名而非对应的列索引数字
datamash --sort --headers groupby Major mean Score < scores_h.txt
GroupBy(Major)  mean(Score)
Arts    68.947368421053
Business        87.363636363636
Engineering     66.538461538462
Health-Medicine 90.615384615385
Life-Sciences   55.333333333333
Social-Sciences 60.266666666667
```
3. 字段分隔符
```
# datamash 默认的字段分隔符是TAB， 多个TAB表示多个字段
printf '1\t\t2\n' | datamash sum 3
2

printf '1\t\t2\n' | cut -f3
2

# -W 一个或多个连续空格均被当做一个字段分隔符
printf '1  \t  2\n' | datamash -W sum 2
2

printf '1  \t  2\n' | datamash -W sum 3
# datamash: invalid input: field 3 requested, line 1 has only 2 fields

# -t, 自定义分隔符
printf '1,10,,100\n' | datamash -t, sum 4
100
```

4. Column Ranges
```
# datamash 对指定列范围的格式类似shell中cut的用法
seq 100 | paste - - - - - | datamash sum 1 sum 2 sum 3 sum 4 sum 5
seq 100 | paste - - - - - | datamash sum 1,2,3,4,5
seq 100 | paste - - - - - | datamash sum 1-5
seq 100 | paste - - - - - | datamash sum 1-3,4-5
970     990     1010    1030    1050

seq 100 | paste - - - - - | datamash sum 1-5 mean 1-5
970     990     1010    1030    1050    48.5    49.5    50.5    51.5    52.5
```
---
一下内容暂时不做整理
5. Transpose and Reverse
```
#(1)Transpose: 转置，类似R中t()函数
#--no-strict：允许行具有不同长度/数量的字段。当原始文件中含有缺失值时，则需要添加此参数。
datamash --no-strict transpose < input1.txt

#--filler XYZ：用XYZ填充缺失的值
datamash --no-strict --filler XYZ transpose < input1.txt

#(2)Reverse: 反转文件中的字段顺序，要求文件中每行的字段数量是一致的
$ cat input.txt
Sample   Year   Count
A        2014   1002
B        2013    990
C        2014   2030
D        2014    599

$ datamash reverse < input.txt
Count   Year    Sample
1002    2014    A
990     2013    B
2030    2014    C
599     2014    D

#(3)Combining Reverse and Transpose
cat input.txt | datamash reverse | datamash transpose
tac input.txt | datamash reverse | datamash transpose
```

6. Groupby
```
# 先使用-t定义冒号为字段分隔符，排序，然后根据第7字段(login shells)分组，最后统计每个login shells有多少users在使用
datamash -t: --sort groupby 7 count 7 < /etc/passwd

# 先使用-t定义冒号为字段分隔符，排序，然后根据第7字段(login shells)分组，最后输出分组键值和以逗号分隔的所有users的列表
cat /etc/passwd | datamash -t: --sort groupby 7 collapse 1
#/bin/bash:root,guest,gordon,charles,alice,bob,postgres
#/bin/false:mysql,rabbitmq,redis,postfix
#/bin/sync:sync
#/usr/sbin/nologin:daemon,bin,sys,games,man,lp,mail,news,uucp,proxy
```

7. Check
```
#datamash check 验证输入的表格结构，以确保所有行中字段数量相同，
#这常应用于pipeline中检查数据文件的结构是否完整，因为如果文件结构不完整，则会以non-zero exit code终止，
#并且会输出关于结构不完整行的详细信息。
datamash check < good.txt && echo ok || echo fail
datamash check < bad.txt && echo ok || echo fail

#(1) 预期行数和列数
# 用法：datamash check [N lines] [N fields]
# 说明：当输入文件的行数或列数与指定值不同，则以non-zero exit code终止
datamash check 4 lines < file.txt && echo ok
datamash check 3 fields < file.txt && echo ok
datamash check 4 lines 3 fields < file.txt && echo ok
datamash check 7 fields < file.txt && echo ok
datamash check 10 lines < file.txt && echo ok

# 为了便利，line,row,rows 可以代替lines; field,columns,column,col 可以代替fields. 
datamash check 4 lines 10 fields < file.txt
datamash check 4 rows  10 columns < file.txt
datamash check 10 col 4 row < file.txt


#(2) checks in automation scripts
#------------------------------------------
#!/bin/sh

die()
{
    base=$(basename "$0")
    echo "$base: error: $@" >&2
    exit 1
}

custom pipeline-or-program > output.txt \
    || die "program failed"

datamash check < output.txt \
    || die "'output.txt' has invalid structure (missing fields)"
```

8. Crosstab
```
cat input.txt
# a    x    3
# a    y    7
# b    x    21
# a    x    40

#默认使用 count，统计每一对(ax, ay, bx, by)出现的次数
datamash -s crosstab 1,2 < input.txt
#      x    y
# a    2    1
# b    1    N/A

#对第三列求和
datamash -s crosstab 1,2 sum 3 < input.txt
#      x    y
# a    43   7
# b    21   N/A

#列出第三列所有唯一值
datamash -s crosstab 1,2 unique 3 < input.txt
#     x    y
#a    3,40 7
#b    21   N/A
```

9. Rounding numbers
```
# 根据不同函数(eg. round/ceil/floor/trunc/frac...)进行约束数值的小数点后N位
( echo X ; seq -1.25 0.25 1.25 ) |\
datamash --full -H round 1 ceil 1 floor 1 trunc 1 frac 1

#   X     round(X)  ceil(X)  floor(X)  trunc(X)   frac(X)
# -1.25   -1        -1       -2        -1         -0.25
# -1.00   -1        -1       -1        -1          0
# -0.75   -1         0       -1         0         -0.75
# -0.50   -1         0       -1         0         -0.5
# -0.25    0         0       -1         0         -0.25
#  0.00    0         0        0         0          0
#  0.25    0         1        0         0          0.25
#  0.50    1         1        0         0          0.5
#  0.75    1         1        0         0          0.75
#  1.00    1         1        1         1          0
#  1.25    1         2        1         1          0.25
```

10. Binning numbers
```
#Bin input values into buckets of size 5:
( echo X ; seq -10 2.5 10 ) | datamash -H --full bin:5 1
#     X  bin(X)
# -10.0    -15
#  -7.5    -10
#  -5.0    -10
#  -2.5     -5
#   0.0      0
#   2.5      0
#   5.0      5
#   7.5      5
#  10.0     10
```

11. Binning strings
```
#将任何字符串输入值哈希(hash)为一个整数。
#典型用法：将一个输入文件分成N个块(chunks), 确保某个键的所有值都存储在同一个块中:
cat input.txt
# PatientA   10
# PatientB   11
# PatientC   12
# PatientA   14
# PatientC   15

# Each patient ID is hashed into a bin between 0 and 9 and printed in the last field:
datamash --full strbin 1 < input.txt
# PatientA   10    5
# PatientB   11    6
# PatientC   12    7
# PatientA   14    5
# PatientC   15    7

# Splitting the input into chunks can be done with awk:
cat input.txt | datamash --full strbin 1 | awk '{print > $NF ".txt"}'
```





---
参考资料：
1. [在命令行进行简单的统计分析](http://blog.lujun9972.win/blog/2020/08/23/%E5%9C%A8%E5%91%BD%E4%BB%A4%E8%A1%8C%E8%BF%9B%E8%A1%8C%E7%AE%80%E5%8D%95%E7%9A%84%E7%BB%9F%E8%AE%A1%E5%88%86%E6%9E%90/index.html)
2. [datamash 教程](https://blog.csdn.net/ada0915/article/details/97372309)
3. []()
4. []()
5. []()
