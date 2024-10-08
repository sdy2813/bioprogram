# 基本操作之正则表达式
正则表达式（regular expression）是具有一定句法的集合或短语，表示某类文本或字符串。正则表达式包含元字符或普通字符。  
优势：使得用户能够利用比较少的预定义字符集合来表示多种字符组合。

+ 元字符
元字符（metacharacter）是代表一组字符或命令的字符。优势是可以减少和命令一起使用的文本数量，用最小的字符集表示多组文本。

## 元字符及其含义与用法
元字符 | 功能 | 表达式 | 匹配示例
:--:|:--:|:--:|:--:
一般字符 | 匹配自身 | abc  | abc
.  | 匹配除换行符（\n）外的任意一个字符 | a.c  | abc
[]  | 匹配字符集中的任意 | 一个字符 | a[bcd]e  | abe,ace,ade
[a-z]  | 匹配任意一个小写字母 | a[a-z]e  | aae,abe,…,aye,aze
[0-9]  | 匹配任意一个数字 | a[0-9]e  | a0e,a1e,…,a8e,a9e
[^]  | 不匹配字符集中的任意一个字符 | a[^bcd]e  | 除abe,ace,ade 外
\  | 转义字符（删除紧跟其后的字符的特殊意义） | a\\.c  | a.c
\d   | 数字，  [0-9]  |  a\dc  |   -a1c
\D   | 非数字  [^\d]   | a\Dc   |  -abc
\s   | 空白字符  [ \t\r\n\f\v]   | a\sc   |  a c
\S   | 非空白字符  [^\s]   |  a\Sc   | abc
\w   | 单词字符， [A-Za-z0-9_]   | a\wc   |  abc
\W   | 非单词字符， [^\w]   |  a\Wc   | a c
?  | 匹配前一个字符零次或一次 | abc?  | ab,abc
\*  | 匹配前一个字符零次或多次 | abc*  | ab,abccc
\+  | 匹配前一个字符一次或多次 | abc+  | abc,abccc
{m}  | 匹配前一个字符m 次 | ab{2}c  | abbc
{m,n}  | 匹配前一个字符m 至n 次 | ab{1,2}c  | abc,abbc
^  | 匹配字符串开头 | ^abc  | [开头]abc
$  | 匹配字符串末尾 | abc$  | abc[末尾]
()  | 分组，创建用于匹配的子串 | ab(cd)?  | ab,abcd
\|  | 或，两边的项目二选一 | ab(cd\|ef)  | abcd,abef


而所谓正则表达式其实就是元字符与普通字符的组合。


## 非贪婪匹配
+ `.+` is greedy and consumes as many characters as it can.
+ `.+?` is reluctant and consumes as few characters as it can.

---
参考资料：
1. [Difference between ".+" and ".+?"](https://stackoverflow.com/questions/14213848/difference-between-and)
2. []()


































