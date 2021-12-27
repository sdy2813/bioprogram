# 相识HTML

使用尖括号包围的关键词称为标签。标签一般成对出现，如<p>和</p>，分别称为开始标签（opening tag）和结束标签（closing tag），或者开放标签和闭合标签

## <!DOCTYPE> 标签
<!DOCTYPE> 声明必须是 HTML 文档的第一行，位于 <html> 标签之前。   
  
<!DOCTYPE> 声明不是 HTML 标签；它是指示 web 浏览器关于页面使用哪个 HTML 版本进行编写的指令。  
声明采用HTML 5的语句是<!DOCTYPE html>，这个语句不属于HTML语言，只告诉浏览器HTML文档使用的HTML版本，并且这个语句不区分大小写。  
  
```html
<!DOCTYPE html>
```

## <head>内的标签

标签 | 意义
:--: | :--:
\<title></title> | 定义网页标题
\<style></style> | 定义内部样式表
\<script></script> | 定义JS代码或引入外部JS文件
\<link/> | 引入外部样式表文件
\<meta/> | 定义网页原信息

<head>元素中必须包含<title>标签，表示文档标题，这个标题会用在搜索引擎的搜索结果展示、浏览器标签标题、收藏夹标题。
  
### <meta/>标签
Meta标签介绍：

+ <meta>元素可提供有关页面的原信息（mata-information）,针对搜索引擎和更新频度的描述和关键词。  
+ <meta>标签位于文档的头部，不包含任何内容。  
+ <meta>提供的信息是用户不可见的。  
meta标签的组成：meta标签共有两个属性，它们分别是http-equiv属性和name 属性，不同的属性又有不同的参数值，这些不同的参数值就实现了不同的网页功能。 

1.http-equiv属性：相当于http的文件头作用，它可以向浏览器传回一些有用的信息，以帮助正确地显示网页内容，与之对应的属性值为content，content中的内容其实就是各个参数的变量值。
```html
<!--2秒后跳转到对应的网址，注意引号-->
<meta http-equiv="refresh" content="2;URL=https://www.baidu.com">
<!--指定文档的编码类型-->
<meta http-equiv="content-Type" charset=UTF8">
<!--告诉IE以最高级模式渲染文档-->
<meta http-equiv="x-ua-compatible" content="IE=edge">
```

2.name属性: 主要用于描述网页，与之对应的属性值为content，content中的内容主要是便于搜索引擎机器人查找信息和分类信息用的。
```html
<meta name="keywords" content="meta总结,html meta,meta属性,meta跳转">
<meta name="description" content="百度一下，你就知道。你知道的太多啦！">
```

## <body>内的标签
### 基本标签
基本标签
```html 
<b>加粗</b>
<i>斜体</i>
<u>下划线</u>
<s>删除</s>
<p>段落标签,标记段落，块级元素</p>
<h1>标题1</h1>
<h2>标题2</h2>
<h3>标题3</h3>
<h4>标题4</h4>
<h5>标题5</h5>
<h6>标题6</h6>
<!-- 为HTML文档添加注释，可以跨越多行 -->
<br>用于换行，行内元素
<hr>水平线标记，块级元素，表示文档内容变化
```

### div标签和span标签
div标签用来定义一个块级元素，并无实际的意义。主要通过CSS样式为其赋予不同的表现。

span标签用来定义内联(行内)元素，并无实际的意义。主要通过CSS样式为其赋予不同的表现。

块级元素与行内元素的区别：
所谓块元素，是以另起一行开始渲染的元素，行内元素则不需另起一行。如果单独在网页中插入这两个元素，不会对页面产生任何的影响。这两个元素是专门为定义CSS样式而生的。

注意：

关于标签嵌套：通常块级元素可以包含内联元素或某些块级元素，但内联元素不能包含块级元素，它只能包含其它内联元素。

p标签不能包含块级标签。

### img标签
<img src="图片的路径" alt="图片未加载成功时的提示" title="鼠标悬浮时提示信息" width="宽" height="高(宽高两个属性只用一个会自动等比缩放)">

### a标签
超链接标签

所谓的超链接是指从一个网页指向一个目标的连接关系，这个目标可以是另一个网页，也可以是相同网页上的不同位置，还可以是一个图片，一个电子邮件地址，一个文件，甚至是一个应用程序。

<a href="http://www.baidu.com" target="_blank" >点我</a>

href属性指定目标网页地址。该地址可以有几种类型：

+ 绝对URL - 指向另一个站点（比如 href="http://www.jd.com）
+ 相对URL - 指当前站点中确切的路径（href="index.htm"）
= 锚URL - 指向页面中的锚（href="#top"）

target属性指定打开链接的目标方式：

+ _blank表示在新标签页中打开目标网页
+ _self表示在当前标签页中打开目标网页列表
+ _parent：在父框架中打开链接文档。
+ _top：在顶级框架中打开链接文档。
+ iframe_name：在指定的iframe中打开链接文档。









